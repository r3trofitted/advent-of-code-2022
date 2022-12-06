#!/usr/bin/env ruby
TRANSMITION = DATA.read.chop.chars

def detect_marker(n) = TRANSMITION.each_with_index { |_, i| p(i + n) and break if TRANSMITION[i,n].uniq.length == n }

detect_marker 4
detect_marker 14

__END__
rnttlvtttmnmpmhpmmzvmmhpmmnrntnnsnrnndvnddmbbtptssjcczmmbwmbmwwmmflfggwzzhjjgppwrwdwqwbbbmwbwgggqccmlmdmgdgqgpqgpgzzndddgdbbsvvfsfppwjwzjjcnjccwrwrprgppbpddnccjggfrggqngqgdqgddvsshqhmqqfvqvlvwvnwwmccrpcczvcczzgsgwwlggqsggmdgglblpblltbbzrbzzcscgccwssbddsmddzzvvhjjwjwrjwrwfftmttplldnllqttdhddmvdmmhsmsmqsqwqpqbpqppqdppbnpnhhppjbbrzrbrggdbddnrdrzrdrpdppzzfzrzgzllwlwzlllwtltslttlmtmqqbbzmzhmmjjwrjrrnzrzhzmmtbbrppmmfddjhdjdsdllrbbpfphpzpwwjvwwdpwpzwwzrrfnfwwfbbpttzjtjptpvvsfvvljjrzzmdmsddpvpgvvdcdwcwhwghwggrjjhdjhddzhhwbhwbwwbrwwrfrmfrfvrfftzzqrzqrqtrqtrqtrqttgctclcwlwwvqqnlnqlnnndmnmggznzhzqzggzrzbbrwbrwrvvscvvmvhmvvbsbjsjfjpfpqpbbbbjtjptpprnndpnnrsswffmnnjhhpqhqwhhbwhbhgbbfrbrjjpmjmzzdzjdjffcvvtwttrrcscvcncqcfcwwpgpfptpcpspllcfcssgbglgdllcdcmcpcqclctcvtvvbhbbdhhczhzshzhbhchzchchlcllwswqqmpmbbqwwzgzhggczgzffsgggjjlcjjpnjjfqjfjvfvrfrlrvvpfpcfcbffnmfmbmbgggplldblddvcvjcvvmbmmmrvrvvnhhqttgdgvdgdqgddcsclljplpbbsvbsbfsffshsgslsllzztggttfccctwtswwrvwvnnfbnnvjnvvlgvvfppmvpmmvpmmcttjffgsffcllncntcncfclcgcppvdvpvrvbrrnnvrvhrvrzvrvnrvrdrnrqrnngsshqhcqqbfqqzmmmzjzqztznttjffqzfqfbqqsggclgclcddtqqdppbjppqvpqvvmqmqnqcnqcqcqvqjqzqbzzbrrgfgddgtgnnpjjbzjjbbtstzszwswggfffmnnpllfvvnwnpwpqwqwlllqlmmzcmcrcmrcmrcrffnrnssjjrdjjwwqgwqgqdggwzwjzzbfbpptctchthbbbqsqggrllldwdffvwwlrwwljwjnncmmjmvjmmqnnmrrgjgvvpqqbppqlpqllqnqdndwwlppcjcdjjcnnmddffgjjrwjrwjjhvhqvhhfssrtsrsgrrwjwhhbqqpzzrdrhrqhrqrprqqmllsszhzllcdllpmpbbmsmjjmwmssvlslwwmtwmmgvgcvggzcgzgddsjsjfsssftfcchhfmfcmcpcpvcppqggjddljjbttwrrhghqggpghgngzngznnzqnnssqlqmqbmmmqdqqhttnqqjhhphrhccbggmjjpwpbwpprdrvvjzvvtctzzmpphwpwdpdvvhbvvdvsdsjdjbdjdljjstswttnhhbfffmnngddlglqggvzvlzvzqqvbqbvbjbnjjsvjjwpjjzshrdtrjttvqnbltrfpvnztrwzrtgjpzgqdjfglqgjrgdzbhqpghdbfhlfjhbfjfjppfgljmgwljlsbmltgztthnzvdrgqlgddvqhzctdgcphfqvnpjjgzwqfvnhvzdrwtpgfdjpqnfshslqmplcprdntnhqqbqptwzvdddhcjcqrfhjqnjvpnhttblwgjwlfwntdchgfjmdbgtqtdgnzbqwzzcltwtmtqtdbvjtfvlzpcvgmrfqwfhwqmhvwhftzgmhshffnjwqbvztszsrrglqvhfpqmbnqjsfnwdwgdtmztbvqrmztfctmvptbwnfzfgdztjgnqsrsqqqnrpgzsqszzwwwgqnnnrdzhzdbqjgbvncprzcjqchzfgnclbrmphbsdwwpvwjwlbshhgjfbhjjtdqrmrcjfnrrhqrpsbglthzpvfglqspttdpwlljhnlrjpzchbrqcgtmcscjnwvpztfjdcwbnbgmbpgdthgnhbrtwftnscbsrndghbslflpcpjwbcjnhzcwdcslmzqbtrlnzmntlpjcsctnsqwtbffqlhfgcsflvfwnmczvsbflnnnzpfjfrcwhhcbtbjcbghtcwcgdbrwrgfgvpwtcwlwcmnmrtcrjbwtwlrfstztsghfvrfjzzpswpqfqpvqstvbhqfjlgmtdlhqrhwzqpnqpllnlgzwptbgftmblqcwfcllbwfzdhrndfrvdvwzqvhnghlzvhldnnvrgqvlpfdnpmcgddjmstzsqfvzwftflrwtzqwjbbqhjpfbdztdfsgsztvvrvslgspgpdcmwszdfsddqhpzpsjgqmgzqvhchlgrmcmzwzbtwfphvgcdmhfdczhffgmqpncdjszzgwfvwsqddvbcgngbjwhmphjsmjthvbthhfwdtqmjctcmdpqpsdrnrzdgzgzctbhwsgvtjgwjbsnnjmpmqgwrnqfqbpnrpddjsrsvmcshhthwfrwmqsrjhlsrgfzvwmdzhwrvchppqldghgzflrnwqnvntmtdwmrpgbdbzvcmnqstzntvllcgzsnvrhqzsfncznhgrggmvrmgsqmhbdsjbsqqhzppfcwdrgdvfjdscrvpwtsdmcnczwbbjhvddprwtzfwslcfdcrqfszcgmhtdfvlqzqtvwngzvmmqcrqpzwzhggjnphsrmnctnfhtppglspnvzrsqfgzdfrrwbzbqwvbvbnzgmdrqrnsvdpvlgcmnggsbmbtfwrvdjrtgtgcqscnfpgswgsngdqnnscffdcnlrcpdpcbpzvqcrtjhlwvgnfhhqmprthrtcvcjjwgprqqdwfbgmzlwttjpvcjzfwbdhvngsjpgtqsvbldbcvhjhzbjzblqtqhlnbzzqfcpnzdhbplztcgvzhbgshqbccgwzhftqvtwzbwmnfrsgphhhgtsmwlqhlcchtbtggqwmbdthhmqqjtfdvfpddfdrtfjbpmwtcbfnrhwcnpdqrdtsfdmjfzdwwgnftnwpssgqtlpdbwhnzcnfmppclsswbhcdghpnslwjznqszgdtrnpncsqsnbrplrfwpbnfnvttlzcjtvhzcpzmhfsfzfjlzqqnprpdvwbfthmrswqrcqqwrnwzmgjqqsnqdblssmhngjjvprmqbswtgzzvprwhrgjqshvmwzgrgfmzlgrtzbmdlzncwqdftfsndvdfmmplswdbjtbcbvcvtpjvrqpghczpqvvpqwfbfhllbpvrrfsmsjhqbldcrwvzvcvzfffqvplbfbdbwctbjsljlfwtbcnpsbtpmcqgdvltmztvrcfsprbnvwplwhncgsdnrdmqnmcvpvvrlmlwtgvrnwvzsfctdlcfvtgqmpnbwcbwvfpmqnbjvwffpjtvvgflhrnlngrzhhttdtdbvscftsqtvbrgzfgsjvwhzjcbsqcttlgwmhhvjhwhgmmdtflfdbvnhgcblqmwjfsqnngjqfbvdnsfbgwjfhpgdgvhpbvlrtpcpvhrbtqpbffzcqrvbqwvqmmrcwtnvcgwvsqzvrwdbcnjshbnbftmmvrmjvgfdwbsjvqfdwnnvqqhbmshcrclrwhfhbtnwqvmrrvdwgcwcsrhdbqndsthmrmbjhttjtzmlflbrmhlcgsbdjcjcvwcjffnqrntpflrgfcngpchtrzpnflwjvcgbwtsnjfqsggwmwhdvbzdpjmtwlmrslnjsndjtgjmmwmdgtnfrztppzqvqhbfzqpsdhvsshddlzwcmsndrpqhndsrjnngnmgmzrvchwlqgdnbssbhpbpgwpsrcnbphpslvqplhpgdhmrnwwjmhvnsfjmrfwtvjjrmgptvjffhbgpmfgmgrcjrwqhccssrqjpljbpwcvsfdtmbhzsmsjsgblgpcqszsttfclrjcnsslmngmbmwqfhddbvmbvwmrmvglsl