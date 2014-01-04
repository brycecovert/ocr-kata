A couple of quick notes about this solution.
1. This was tested with ruby 1.9.3 on OSX. Theres really only one dependency, rspec. Gemfile included. Feel free to run them with `rspec spec`
2. Unless explicitly stated, I tried to assume input is correct. I opted for minimal edge case validation for the purposes of keeping the implementation simple and easy to review.
3. To run, you can `./run_ocr.rb recommended_test_cases.rb`
4. Purely by coincidence:
```bash
$ cat *.rb | wc -l
      56

$ wc -l recommended_test_cases.txt
      56
```
