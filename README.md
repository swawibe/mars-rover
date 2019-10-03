# mars-rover

This is a classic problem taken from Google archive ([Mars Rover technical challenge](https://code.google.com/archive/p/marsrovertechchallenge/)).

### Steps to execute:
- Modify **input_file.txt** in a correct format and save it
    - The first line (`5 5`) is a coordinate of top right corner 
    - Other lines come in a couple:
        - Where the first line of couple is coordinate of a Rover (`1, 2`) and direction (`N`)
        - The second line is for directions (`LMLMLMLMM`)
    - Similarly if you want to add another Rover, then add another two lines
- Execute **input_parse.rb** with ruby command (`ruby input_parse.rb`)
- The output should be stored in a **output.txt** file. If you execute 
**input_parse.rb** multiple times, then the output will be appended in 
**output.txt** file.