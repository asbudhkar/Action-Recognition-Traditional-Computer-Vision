% Helper File

files = dir('*.avi');
% Loop through each
for id = 1:length(files)
    % Get the file name (minus the extension)
    [~, f] = fileparts(files(id).name);
      % Convert to number
      num = str2double(f);
      if ~isnan(num)
          % If numeric, rename
          movefile(files(id).name, sprintf('hc_%d.avi',id));
      end
end