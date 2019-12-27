Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 868E412BB7A
	for <lists+linux-next@lfdr.de>; Fri, 27 Dec 2019 22:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfL0Vvx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Dec 2019 16:51:53 -0500
Received: from mail-pj1-f45.google.com ([209.85.216.45]:37362 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfL0Vvx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Dec 2019 16:51:53 -0500
Received: by mail-pj1-f45.google.com with SMTP id m13so5468121pjb.2;
        Fri, 27 Dec 2019 13:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bipz4vy7SWDNj9D55kGyVU3mkpBIdCRTBcqBI4hQgGU=;
        b=Gx87LvZH/x+KkQ25gdgduhvsGPcxrVMONffhgcNTJN/BkUnVoFo/s/6uUNJJRhEbwH
         sSgwNKNPYx+tT2KWBWM465Vxrrd2bMkpclphosRR3j3P5c5pnkzg1E9F6OYCSW4diH3h
         yooKzfW7uKeiTmh/JH7aJHmFocWvvY8gZT1LW0N8Qmn/f9B+UcwL0TCVrbUUv9q1gukH
         YFYHPcN95ASgHJLisUVdTJs7Mru5ooBpbC632ofoJpaRZYzbGJHmrWzCpCWxi7EgTwZ7
         9j7ZPBNBTk/RQ96i64BYvPz8KNLkSQ3h6d0busZHibHsW8WfJ23KniVEzmzOcsw8+ydJ
         WbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Bipz4vy7SWDNj9D55kGyVU3mkpBIdCRTBcqBI4hQgGU=;
        b=eFUJ68RC59tcRX5hNrMBWliFAh5ghkcGFIFiC0ora3Ar88I0o7VYqVNbgU1yeRmZTd
         BYu1ZIfKD56N7xpvKm2O+Rmi6sxFMpmvcqlwqoJAJt239nBIN9O1od+6gIlv7pmLwUIO
         GaLFqNTXZZDYanY3dWDEqKmd+jc+HgzB6JVBy9oEpd481MakmXwzd0vrTiPe0SDEPKB3
         Q8XezLkuLbkgqDwUnm5v4RBoh3uXZIQJh2H1AmSTuMZfkw32OeES9q0L5Da1aYchCWAq
         +CAqEm+C04DOWZtal0mGqODGLfxqx4iwkpu2DROTGj7/ORBvcJBYbOFX+xre+QPd2H7o
         dHKw==
X-Gm-Message-State: APjAAAVbGMotAaqHQIqcQm/xjr0s2YsaKoKv7Cana+fEGf/hPLqVKBAb
        S9cbyQMLMMzAhN0h/TrklGtuyCUx
X-Google-Smtp-Source: APXvYqzJd43bumA7Cn7p2hGNap8+eqx/PW+APPX3TezsKr3Cu4x65pqWtK8xj9swyc0b8BnSoYFjnw==
X-Received: by 2002:a17:902:bd41:: with SMTP id b1mr45037625plx.82.1577483512172;
        Fri, 27 Dec 2019 13:51:52 -0800 (PST)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id u3sm39180110pga.72.2019.12.27.13.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 13:51:51 -0800 (PST)
Subject: Re: linux-next: Fixes tags need some work in the block tree
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaedon Shin <jaedon.shin@gmail.com>
References: <20191228065553.6ba5d28f@canb.auug.org.au>
 <45665759-a76f-5631-51bd-488b04f6bf03@gmail.com>
 <d3ae7893-9b60-ecc2-4a31-65d009ecbb95@kernel.dk>
 <20191228073959.5b3e73b5@canb.auug.org.au>
 <3e6975e8-0509-c888-5b90-489ca0f40456@kernel.dk>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 mQGiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyR
 xGlkaOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQ
 X3IzRnWoqlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0E
 AICDzi3l7pmC5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0d
 ZdWX6fqkJJlu9cSDvWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAX
 SAgsrBhcgGl2Rl5gh/jkeA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYc
 nzJJ63ng3tHhnwHXZOu8hL4nqwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbh
 qIWgvr3SIEuR6ayY3f5j0f2ejUMYlYYnKdiHXFlF9uXm1ELrb0YX4GMHz7QnRmxvcmlhbiBG
 YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+iGYEExECACYCGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBhV5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS
 6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSC5BA0ESM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3
 WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqOvdi7YidfBVdKi0wxHhSuRBfuOppu
 pdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qXY5Dcagk9LqFNGhJQzUGHAsIs
 hap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXGuVtZLT52nK6Wv2EZ1TiT
 OiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/TowdieF1rWN/MYHlkpyj9c
 Rpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKmYwZgA8DrrB0M
 oaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBoBwE3Z3MY
 31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3mFrRO
 BbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsE
 FRuiSVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo
 7IiYaNssCS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48m
 vIyQ4Ijnb6GTrtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4P
 WU11Nr9i/qoV8QCo12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+
 HZA8SL54j479ubxhfuoTu5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjW
 HaKaX23Awt97AqQZXegbfkJwX2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mz
 Joil+u3k01ofvJMK0ZdzGUZ/aPMZ16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKy
 kuVag+IijCIom78P9jRtB1q1Q5lwZp2TLAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9
 aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTC
 y5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6DChDrguup2aJVU4hPBBgRAgAPAhsMBQJU
 X9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMeqX5aD/aq/dsbXSfyAKC45Go0YyxV
 HGuUuzv+GKZ6nsysJ7kCDQRXG8fwARAA6q/pqBi5PjHcOAUgk2/2LR5LjjesK50bCaD4JuNc
 YDhFR7Vs108diBtsho3w8WRd9viOqDrhLJTroVckkk74OY8r+3t1E0Dd4wHWHQZsAeUvOwDM
 PQMqTUBFuMi6ydzTZpFA2wBR9x6ofl8Ax+zaGBcFrRlQnhsuXLnM1uuvS39+pmzIjasZBP2H
 UPk5ifigXcpelKmj6iskP3c8QN6x6GjUSmYx+xUfs/GNVSU1XOZn61wgPDbgINJd/THGdqiO
 iJxCLuTMqlSsmh1+E1dSdfYkCb93R/0ZHvMKWlAx7MnaFgBfsG8FqNtZu3PCLfizyVYYjXbV
 WO1A23riZKqwrSJAATo5iTS65BuYxrFsFNPrf7TitM8E76BEBZk0OZBvZxMuOs6Z1qI8YKVK
 UrHVGFq3NbuPWCdRul9SX3VfOunr9Gv0GABnJ0ET+K7nspax0xqq7zgnM71QEaiaH17IFYGS
 sG34V7Wo3vyQzsk7qLf9Ajno0DhJ+VX43g8+AjxOMNVrGCt9RNXSBVpyv2AMTlWCdJ5KI6V4
 KEzWM4HJm7QlNKE6RPoBxJVbSQLPd9St3h7mxLcne4l7NK9eNgNnneT7QZL8fL//s9K8Ns1W
 t60uQNYvbhKDG7+/yLcmJgjF74XkGvxCmTA1rW2bsUriM533nG9gAOUFQjURkwI8jvMAEQEA
 AYkCaAQYEQIACQUCVxvH8AIbAgIpCRBhV5kVtWN2DsFdIAQZAQIABgUCVxvH8AAKCRCH0Jac
 RAcHBIkHD/9nmfog7X2ZXMzL9ktT++7x+W/QBrSTCTmq8PK+69+INN1ZDOrY8uz6htfTLV9+
 e2W6G8/7zIvODuHk7r+yQ585XbplgP0V5Xc8iBHdBgXbqnY5zBrcH+Q/oQ2STalEvaGHqNoD
 UGyLQ/fiKoLZTPMur57Fy1c9rTuKiSdMgnT0FPfWVDfpR2Ds0gpqWePlRuRGOoCln5GnREA/
 2MW2rWf+CO9kbIR+66j8b4RUJqIK3dWn9xbENh/aqxfonGTCZQ2zC4sLd25DQA4w1itPo+f5
 V/SQxuhnlQkTOCdJ7b/mby/pNRz1lsLkjnXueLILj7gNjwTabZXYtL16z24qkDTI1x3g98R/
 xunb3/fQwR8FY5/zRvXJq5us/nLvIvOmVwZFkwXc+AF+LSIajqQz9XbXeIP/BDjlBNXRZNdo
 dVuSU51ENcMcilPr2EUnqEAqeczsCGpnvRCLfVQeSZr2L9N4svNhhfPOEscYhhpHTh0VPyxI
 pPBNKq+byuYPMyk3nj814NKhImK0O4gTyCK9b+gZAVvQcYAXvSouCnTZeJRrNHJFTgTgu6E0
 caxTGgc5zzQHeX67eMzrGomG3ZnIxmd1sAbgvJUDaD2GrYlulfwGWwWyTNbWRvMighVdPkSF
 6XFgQaosWxkV0OELLy2N485YrTr2Uq64VKyxpncLh50e2RnyAJ9qfUATKC9NgZjRvBztfqy4
 a9BQwACgnzGuH1BVeT2J0Ra+ZYgkx7DaPR0=
Message-ID: <e90eed94-3c56-3bc8-f118-f46f2dfe0571@gmail.com>
Date:   Fri, 27 Dec 2019 13:51:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <3e6975e8-0509-c888-5b90-489ca0f40456@kernel.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 12/27/2019 12:44 PM, Jens Axboe wrote:
> On 12/27/19 1:39 PM, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> On Fri, 27 Dec 2019 13:29:40 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>> On 12/27/19 1:27 PM, Florian Fainelli wrote:
>>>> On 12/27/2019 11:55 AM, Stephen Rothwell wrote:  
>>>>>
>>>>> In commit
>>>>>
>>>>>   1a3d78cb6e20 ("ata: ahci_brcm: BCM7425 AHCI requires AHCI_HFLAG_DELAY_ENGINE")
>>>>>
>>>>> Fixes tags
>>>>>
>>>>>   Fixes: 9586114cf1e9 ("ata: ahci_brcmstb: add support MIPS-based platforms")
>>>>>   Fixes: 423be77daabe ("ata: ahci_brcmstb: add quirk for broken ncq")
>>>>>
>>>>> have this problem:
>>>>>
>>>>>   - Target SHA1s do not exist
>>>>>
>>>>> Perhaps you meant
>>>>>
>>>>> Fixes: 1980eb9bd7d7 ("ata: ahci_brcmstb: add support for MIPS-based platforms")
>>>>> Fixes: 7de3244530bf ("ata: ahci_brcmstb: disable NCQ for MIPS-based platforms")  
>>>>
>>>> Yes, those are the two that should have been used, the two commits were
>>>> extracted from a downstream tree where the upstream commits ended up
>>>> looking slightly different, my script does not (yet) rewrite those, Jens
>>>> would you want me to resubmit or can you rewrite the commit message in
>>>> place?  
>>>
>>> It's too late unfortunately, Linus already pulled it. So we'll have to
>>> live with it, at least the commit titles are correct so it should be
>>> manageable.
>>
>> Unfortunately, even the titles are not correct, so they took me a
>> little time to find the correct commits :-(  This means it will also
>> take the stable maintainers a bit of time.
> 
> Yeah I see, the 2nd one is not. Gah, that really sucks. I'll let stable
> know.
> 
> Florian, please ensure that future submissions have both the right titles
> and shas.

Definitively, very sorry about that and thank you both.
-- 
Florian
