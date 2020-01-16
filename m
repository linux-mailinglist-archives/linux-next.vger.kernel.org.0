Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5AB613FA15
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 20:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730499AbgAPT7B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 14:59:01 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43539 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729459AbgAPT7B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 14:59:01 -0500
Received: by mail-ed1-f65.google.com with SMTP id dc19so20053958edb.10;
        Thu, 16 Jan 2020 11:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=X3mFokYextFLcrpGWLY9Jk31aBBfxazQmn+NhdjvDzE=;
        b=t+Ln7o/z6rcbb+BvKgK/RdwZ84sWZN0t1HU+VL1/J9809dmUDmIqR9Brne/6eoLyRU
         HF94mFVtZmXzeLiIeQH05mCRypFJ1vIN4UQMjW6AqcoyrToPtq4fxdJaFe4LaQkY7P+1
         VbR+14TKl31YY5l+ThGgtsrg7zXPq8ShqwvHibf20lXDc65avYqM2BYEgLhp62dU8xfO
         FPw1cuyGSYAS7FA2n3SSV4zYDnLCVvnKcOdE9Z9ACnHGYdKtnBmbTTsIZjKx0YiIWgQD
         77duS73uRPBv3euPZ7NcXYu7q99bgYmVYkfn/vyFjQV8ZYaem0yQxcL1pOFMFiwaOBYT
         6caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=X3mFokYextFLcrpGWLY9Jk31aBBfxazQmn+NhdjvDzE=;
        b=dGZZgtXM9YXJrWu6AgwqUtenFsWr+IrBObJSWj8lmw0YoaxmqnotnLZnsXjk64hCAf
         cGnSkh5t7+RJcmjETYED9EZypi7r4JVM8whJFK0DmeQ0Vw3Vt2eeYnv3nJHwhYop1tOM
         zkx2DESRn7a6qqVW/Y17KrZ591mLb8FHisNwIJ220sCZiGJVn8Jr32cRBEqCPQYbg9Ci
         d4b8I8FaWeiMFFOhWK4NjFA1jfyPyM2j0f9Bv1oTZDBQwJ/bx23aKqTSgb/46kTTxQWO
         gvSNQgH1k+MGajwy+D9He3nHZ5TunjkPjuCZN5HLDK0b8tm6PAHzBA9dI/3TFRHno9ne
         ZFRQ==
X-Gm-Message-State: APjAAAUtUVO3N/65nfJcICjC9JYyAnH1LJ1bJvqM1wPki5JQ/3ucdHDj
        h9RG8iok3gChPfx8g2yMwnE=
X-Google-Smtp-Source: APXvYqxRUPTFlhyvLtPodaU+kKGnxN1NGlXlNt/Ct7NWWZ5dTD9BQgnp/TJTwbELIN/mASJkEjlp7g==
X-Received: by 2002:a50:93a2:: with SMTP id o31mr64238eda.160.1579204739232;
        Thu, 16 Jan 2020 11:58:59 -0800 (PST)
Received: from [10.67.50.41] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id s16sm919276edy.51.2020.01.16.11.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 11:58:58 -0800 (PST)
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Yann Gautier <yann.gautier@st.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Ludovic Barre <ludovic.barre@st.com>
References: <20200113065808.25f28c40@canb.auug.org.au>
 <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
 <20200113113837.130c3936@canb.auug.org.au>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <ac7bef3f-8319-1bbd-ae64-c02a0b74a7be@gmail.com>
Date:   Thu, 16 Jan 2020 11:58:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113113837.130c3936@canb.auug.org.au>
Content-Type: multipart/mixed;
 boundary="------------1B6BC910FD7428A5298A4234"
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------1B6BC910FD7428A5298A4234
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 1/12/20 4:38 PM, Stephen Rothwell wrote:
> Hi Olof,
> 
> On Sun, 12 Jan 2020 11:59:58 -0800 Olof Johansson <olof@lixom.net> wrote:
>>
>> Thanks for the report. Time to automate this at our end, we've had a
>> few too many of these slip through all the way to you lately.
>>
>> Where do you keep your scripts that you catch these things with? Do
>> you have a writeup of the checks you do? I should add it to my
>> automation once and for all.
> 
> I should export my linux-next scripts as a git repo, but I haven't (yet) :-(
> 
> Attached pleas find check_commits which I run after fetching each tree
> and pass the changed commit range.  This, in turn, runs check_fixes
> (also attached).

This is definitively very useful, and after being burned by improper
Fixes: tag recently, I ended modifying your check_fixes script and
putting in my list of pre-commit scripts to run with a wrapper around,
although that required making a few modifications:

- add an optional second parameter to let you specify a hook mode which
derives the git tree from the current directory

- added negative return codes upon error

- added a "did you mean" when the SHA1 cannot be found but the subject
was correct

I am not sure what is the intention of the target_subject vs. subject
check  as it seems to always fail for me when using a commit that I used
as a test for the script, e.g.:

subject: net: systemport: Simplify queue mapping logic
target_subject: net: systemport: Fixed queue mapping in internal ring map

under what circumstances do you have both subjects match?

Cheers
-- 
Florian

--------------1B6BC910FD7428A5298A4234
Content-Type: application/x-shellscript;
 name="check_fixes.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="check_fixes.sh"

IyEvYmluL2Jhc2gKCmlmIFsgIiQjIiAtbHQgMSBdOyB0aGVuCiAgICAgICAgcHJpbnRmICdV
c2FnZTogJXMgPGNvbW1pdCByYW5nZT5cbicsICIkMCIgMT4mMgogICAgICAgIGV4aXQgMQpm
aQoKIyBUaGlzIHNob3VsZCBiZSBhIGdpdCB0cmVlIHRoYXQgY29udGFpbnMgKm9ubHkqIExp
bnVzJyB0cmVlCkxpbnVzX3RyZWU9IiR7SE9NRX0va2VybmVscy9saW51cy5naXQiCmhvb2tf
bW9kZT0iMCIKCmlmIFsgIiQyIiA9ICItZyIgXTsgdGhlbgoJTGludXNfdHJlZT0iJFBXRCIK
CWhvb2tfbW9kZT0iMSIKZmkKCmNvbW1pdHM9JChnaXQgcmV2LWxpc3QgLS1uby1tZXJnZXMg
LWkgLS1ncmVwPSdeW1s6c3BhY2U6XV0qRml4ZXM6JyAiJEAiKQppZiBbIC16ICIkY29tbWl0
cyIgXTsgdGhlbgogICAgICAgIGV4aXQgMApmaQoKc3BsaXRfcmU9J14oW0NjXVtPb11bTW1d
W01tXVtJaV1bVHRdKT9bWzpzcGFjZTpdXSooW1s6eGRpZ2l0Ol1dezUsfSkoW1s6c3BhY2U6
XV0qKSguKikkJwpubD0kJ1xuJwp0YWI9JCdcdCcKcmV0X2NvZGU9MAoKIyBTdHJpcCB0aGUg
bGVhZGluZyBhbmQgdHJhaW5pbmcgc3BhY2VzIGZyb20gYSBzdHJpbmcKc3RyaXBfc3BhY2Vz
KCkKewoJW1sgIiQxIiA9fiBeW1s6c3BhY2U6XV0qKC4qW15bOnNwYWNlOl1dKVtbOnNwYWNl
Ol1dKiQgXV0KCWVjaG8gIiR7QkFTSF9SRU1BVENIWzFdfSIKfQoKZm9yIGMgaW4gJGNvbW1p
dHM7IGRvCgoJY29tbWl0X2xvZz0kKGdpdCBsb2cgLTEgLS1mb3JtYXQ9JyVoICgiJXMiKScg
IiRjIikKCWNvbW1pdF9tc2c9IkluIGNvbW1pdAoKICAkY29tbWl0X2xvZwoKIgoKCWZpeGVz
X2xpbmVzPSQoZ2l0IGxvZyAtMSAtLWZvcm1hdD0nJUInICIkYyIgfAoJCQlncmVwIC1pICde
W1s6c3BhY2U6XV0qRml4ZXM6JykKCgl3aGlsZSByZWFkIC1yIGZsaW5lOyBkbwoJCVtbICIk
ZmxpbmUiID1+IF5bWzpzcGFjZTpdXSpbRmZdW0lpXVtYeF1bRWVdW1NzXTpbWzpzcGFjZTpd
XSooLiopJCBdXQoJCWY9IiR7QkFTSF9SRU1BVENIWzFdfSIKCQlmaXhlc19tc2c9IkZpeGVz
IHRhZwoKICAkZmxpbmUKCmhhcyB0aGVzZSBwcm9ibGVtKHMpOgoKIgoJCXNoYT0KCQlzdWJq
ZWN0PQoJCW1zZz0KCQlpZiBbWyAiJGYiID1+ICRzcGxpdF9yZSBdXTsgdGhlbgoJCQlmaXJz
dD0iJHtCQVNIX1JFTUFUQ0hbMV19IgoJCQlzaGE9IiR7QkFTSF9SRU1BVENIWzJdfSIKCQkJ
c3BhY2VzPSIke0JBU0hfUkVNQVRDSFszXX0iCgkJCXN1YmplY3Q9IiR7QkFTSF9SRU1BVENI
WzRdfSIKCQkJaWYgWyAiJGZpcnN0IiBdOyB0aGVuCgkJCQltc2c9IiR7bXNnOiske21zZ30k
e25sfX0gIC0gbGVhZGluZyB3b3JkICckZmlyc3QnIHVuZXhwZWN0ZWQiCgkJCWZpCgkJCWlm
IFsgLXogIiRzdWJqZWN0IiBdOyB0aGVuCgkJCQltc2c9IiR7bXNnOiske21zZ30ke25sfX0g
IC0gbWlzc2luZyBzdWJqZWN0IgoJCQllbGlmIFsgLXogIiRzcGFjZXMiIF07IHRoZW4KCQkJ
CW1zZz0iJHttc2c6KyR7bXNnfSR7bmx9fSAgLSBtaXNzaW5nIHNwYWNlIGJldHdlZW4gdGhl
IFNIQTEgYW5kIHRoZSBzdWJqZWN0IgoJCQlmaQoJCQlyZXRfY29kZT0nMScKCQllbHNlCgkJ
CXByaW50ZiAnJXMlcyAgLSAlc1xuJyAiJGNvbW1pdF9tc2ciICIkZml4ZXNfbXNnIiAnTm8g
U0hBMSByZWNvZ25pc2VkJwoJCQljb21taXRfbXNnPScnCgkJCXJldF9jb2RlPScxJwoJCQlj
b250aW51ZQoJCWZpCgkJaWYgISBnaXQgcmV2LXBhcnNlIC1xIC0tdmVyaWZ5ICIkc2hhIiA+
L2Rldi9udWxsOyB0aGVuCgkJCXByaW50ZiAnJXMlcyAgLSAlc1xuJyAiJGNvbW1pdF9tc2ci
ICIkZml4ZXNfbXNnIiAnVGFyZ2V0IFNIQTEgZG9lcyBub3QgZXhpc3QnCgkJCWZpeGVzX2Nh
bmRpZGF0ZXM9JChnaXQgbG9nIC0tZ3JlcD0iJChlY2hvICRzdWJqZWN0IHwgc2VkIC1lICdz
L14oXCguKlwpKSQvXDEvJykiIC0tZm9ybWF0PSIlaCIpCgkJCWlmIFsgISAteiAiJGZpeGVz
X2NhbmRpZGF0ZXMiIF07IHRoZW4KCQkJCXByaW50ZiAnXG5Qb3NzaWJsZSBjYW5kaWRhdGU6
XG5cbicKCQkJCXByaW50ZiAnICBGaXhlczogJXMgJXNcbicgIiRmaXhlc19jYW5kaWRhdGVz
IiAiJHN1YmplY3QiCgkJCWZpCgkJCWNvbW1pdF9tc2c9JycKCQkJcmV0X2NvZGU9JzEnCgkJ
CWNvbnRpbnVlCgkJZmkKCgkJaWYgWyAiJHsjc2hhfSIgLWx0IDEyIF07IHRoZW4KCQkJbXNn
PSIke21zZzorJHttc2d9JHtubH19ICAtIFNIQTEgc2hvdWxkIGJlIGF0IGxlYXN0IDEyIGRp
Z2l0cyBsb25nJHtubH0gICAgQ2FuIGJlIGZpeGVkIGJ5IHNldHRpbmcgY29yZS5hYmJyZXYg
dG8gMTIgKG9yIG1vcmUpIG9yIChmb3IgZ2l0IHYyLjExJHtubH0gICAgb3IgbGF0ZXIpIGp1
c3QgbWFraW5nIHN1cmUgaXQgaXMgbm90IHNldCAob3Igc2V0IHRvIFwiYXV0b1wiKS4iCgkJ
CWV4aXQgMQoJCWZpCgkJIyByZWR1Y2UgdGhlIHN1YmplY3QgdG8gdGhlIHBhcnQgYmV0d2Vl
biAoKSBpZiB0aGVyZQoJCWlmIFtbICIkc3ViamVjdCIgPX4gXlwoKC4qKVwpIF1dOyB0aGVu
CgkJCXN1YmplY3Q9IiR7QkFTSF9SRU1BVENIWzFdfSIKCQllbGlmIFtbICIkc3ViamVjdCIg
PX4gXlwoKC4qKSBdXTsgdGhlbgoJCQlzdWJqZWN0PSIke0JBU0hfUkVNQVRDSFsxXX0iCgkJ
CW1zZz0iJHttc2c6KyR7bXNnfSR7bmx9fSAgLSBTdWJqZWN0IGhhcyBsZWFkaW5nIGJ1dCBu
byB0cmFpbGluZyBwYXJlbnRoZXNlcyIKCQlmaQoKCQlpZiBbICIkaG9va19tb2RlIiAtZXEg
IjEiIF07IHRoZW4KCQkJZXhpdCAkcmV0X2NvZGUKCQlmaQoKCQkjIHN0cmlwIG1hdGNoaW5n
IHF1b3RlcyBhdCB0aGUgc3RhcnQgYW5kIGVuZCBvZiB0aGUgc3ViamVjdAoJCSMgdGhlIHVu
aWNvZGUgY2hhcmFjdGVycyBpbiB0aGUgY2xhc3NlcyBhcmUKCQkjIFUrMjAxQyBMRUZUIERP
VUJMRSBRVU9UQVRJT04gTUFSSwoJCSMgVSsyMDFEIFJJR0hUIERPVUJMRSBRVU9UQVRJT04g
TUFSSwoJCSMgVSsyMDE4IExFRlQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCgkJIyBVKzIwMTkg
UklHSFQgU0lOR0xFIFFVT1RBVElPTiBNQVJLCgkJcmUxPSQnXltcIlx1MjAxQ10oLiopW1wi
XHUyMDFEXSQnCgkJcmUyPSQnXltcJ1x1MjAxOF0oLiopW1wnXHUyMDE5XSQnCgkJcmUzPSQn
XltcIlwnXHUyMDFDXHUyMDE4XSguKikkJwoJCWlmIFtbICIkc3ViamVjdCIgPX4gJHJlMSBd
XTsgdGhlbgoJCQlzdWJqZWN0PSIke0JBU0hfUkVNQVRDSFsxXX0iCgkJZWxpZiBbWyAiJHN1
YmplY3QiID1+ICRyZTIgXV07IHRoZW4KCQkJc3ViamVjdD0iJHtCQVNIX1JFTUFUQ0hbMV19
IgoJCWVsaWYgW1sgIiRzdWJqZWN0IiA9fiAkcmUzIF1dOyB0aGVuCgkJCXN1YmplY3Q9IiR7
QkFTSF9SRU1BVENIWzFdfSIKCQkJbXNnPSIke21zZzorJHttc2d9JHtubH19ICAtIFN1Ympl
Y3QgaGFzIGxlYWRpbmcgYnV0IG5vIHRyYWlsaW5nIHF1b3RlcyIKCQlmaQoKCQlzdWJqZWN0
PSQoc3RyaXBfc3BhY2VzICIkc3ViamVjdCIpCgoJCXRhcmdldF9zdWJqZWN0PSQoZ2l0IGxv
ZyAtMSAtLWZvcm1hdD0nJXMnICIkc2hhIikKCQl0YXJnZXRfc3ViamVjdD0kKHN0cmlwX3Nw
YWNlcyAiJHRhcmdldF9zdWJqZWN0IikKCgkJIyBtYXRjaCB3aXRoIGVsbGlwc2VzCgkJY2Fz
ZSAiJHN1YmplY3QiIGluCgkJKi4uLikJc3ViamVjdD0iJHtzdWJqZWN0JS4uLn0iCgkJCXRh
cmdldF9zdWJqZWN0PSIke3RhcmdldF9zdWJqZWN0OjA6JHsjc3ViamVjdH19IgoJCQk7OwoJ
CS4uLiopCXN1YmplY3Q9IiR7c3ViamVjdCMuLi59IgoJCQl0YXJnZXRfc3ViamVjdD0iJHt0
YXJnZXRfc3ViamVjdDogLSR7I3N1YmplY3R9fSIKCQkJOzsKCQkqXCAuLi5cICopCgkJCXMx
PSIke3N1YmplY3QlIC4uLiAqfSIKCQkJczI9IiR7c3ViamVjdCMqIC4uLiB9IgoJCQlzdWJq
ZWN0PSIkczEgJHMyIgoJCQl0MT0iJHt0YXJnZXRfc3ViamVjdDowOiR7I3MxfX0iCgkJCXQy
PSIke3RhcmdldF9zdWJqZWN0OiAtJHsjczJ9fSIKCQkJdGFyZ2V0X3N1YmplY3Q9IiR0MSAk
dDIiCgkJCTs7CgkJZXNhYwoJCXN1YmplY3Q9JChzdHJpcF9zcGFjZXMgIiRzdWJqZWN0IikK
CQl0YXJnZXRfc3ViamVjdD0kKHN0cmlwX3NwYWNlcyAiJHRhcmdldF9zdWJqZWN0IikKCgkJ
aWYgWyAiJHN1YmplY3QiICE9ICIke3RhcmdldF9zdWJqZWN0OjA6JHsjc3ViamVjdH19IiBd
OyB0aGVuCgkJCW1zZz0iJHttc2c6KyR7bXNnfSR7bmx9fSAgLSBTdWJqZWN0IGRvZXMgbm90
IG1hdGNoIHRhcmdldCBjb21taXQgc3ViamVjdCR7bmx9ICAgIEp1c3QgdXNlJHtubH0ke3Rh
Yn1naXQgbG9nIC0xIC0tZm9ybWF0PSdGaXhlczogJWggKFwiJXNcIiknIgoJCWZpCgkJbHNo
YT0kKGNkICIkTGludXNfdHJlZSIgJiYgZ2l0IHJldi1wYXJzZSAtcSAtLXZlcmlmeSAiJHNo
YSIpCgkJaWYgWyAteiAiJGxzaGEiIF07IHRoZW4KCQkJY291bnQ9JChnaXQgcmV2LWxpc3Qg
LS1jb3VudCAiJHNoYSIuLiIkYyIpCgkJCWlmIFsgIiRjb3VudCIgLWVxIDAgXTsgdGhlbgoJ
CQkJbXNnPSIke21zZzorJHttc2d9JHtubH19ICAtIFRhcmdldCBpcyBub3QgYW4gYW5jZXN0
b3Igb2YgdGhpcyBjb21taXQiCgkJCWZpCgkJZmkKCQlpZiBbICIkbXNnIiBdOyB0aGVuCgkJ
CXByaW50ZiAnJXMlcyVzXG4nICIkY29tbWl0X21zZyIgIiRmaXhlc19tc2ciICIkbXNnIgoJ
CQljb21taXRfbXNnPScnCgkJZmkKCWRvbmUgPDw8ICIkZml4ZXNfbGluZXMiCmRvbmUKCmV4
aXQgJHJldF9jb2RlCg==
--------------1B6BC910FD7428A5298A4234
Content-Type: application/x-shellscript;
 name="pre-commit-checks.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="pre-commit-checks.sh"

IyEvYmluL3NoCmV4ZWMgJChkaXJuYW1lICQwKS9jaGVja19maXhlcy5zaCBIRUFEfjEuLkhF
QUQgLWcK
--------------1B6BC910FD7428A5298A4234--
