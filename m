Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45BA113B0F6
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 18:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgANRbH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 12:31:07 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43128 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgANRbH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 12:31:07 -0500
Received: by mail-qt1-f194.google.com with SMTP id d18so13137780qtj.10
        for <linux-next@vger.kernel.org>; Tue, 14 Jan 2020 09:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=St8u8FHo8VDNQhqovRVh1AEgg+/3cFOh49eIYTEBzOA=;
        b=KmITXcZxS4p4wtILg0kSu5+Q6s914wx0sh4RpeA8OW+jjWbd4bH7wyOZKSASZOcLcF
         gHf1IkT8rWqxLcWvZWox26Uh5NPyVZ4YfpNLRbWw2LzvOVgTh7MJ/n41AP/KAz4ZD5Q8
         BlUTg92fI4wjTjAFbjLHrAlrOjZ45R2mcKQYMp2ddf1z5pNzgdWNbIReGgIADIXojx6y
         v+NlpEbuipbRZrYrkqN/DHK+W+xKJxaIIkRb2/whNeMQWzak5bsZvb07HPuiWE7M8OB/
         CaCM65yHWKR4wbwqjTavSnDzl76xVhG8DrKbAuzkZeXD9O+XZ6MmXR9A5wvwwYHQF0qS
         mQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=St8u8FHo8VDNQhqovRVh1AEgg+/3cFOh49eIYTEBzOA=;
        b=apLgqcIBQkCvH4eseXEMgwDH8MYMg2lxOQciWgJ0S9DVyLiKy65uq7HOjtU9EYqUAg
         mI7MiG+MYN96OJ3qjj1r9XF0mjbUPqJF65U7mrYNz9EvNWGQBUDnQmfkON2SC/eiGCnJ
         SYGFuQb2co8/WDr4x6Srq9F6WSKsSLRW+6gf5nBIOBw2npTo1T+0FeWsDdoYdO/SwA2U
         tg1pNmcEF7vlJrlkxGnIzBfBP2IwpWhsiRuy5LQahSFm0FhPWNIziYZlrIKWqaw1W5bh
         sy8/ZyaR+h4guF27AMfkP6Q44igT8LIQZmcjGi4DdDWmz/vVnMKxj1izKpJwUvVaR6Fp
         cZhg==
X-Gm-Message-State: APjAAAXHq/g/XH20TMn+k4jtNN0DV5myCu114a68o6BUkwsugtwrYQQy
        txESB63XPw+9WFtM7A33ui2YvQ==
X-Google-Smtp-Source: APXvYqy1//b/irP1NAsyHKlgVn2OQv5aVwXISbM+nbSM7GAcVl3KkEqjAbpA+LmhLCr4ZR199oyePQ==
X-Received: by 2002:ac8:478a:: with SMTP id k10mr4603821qtq.260.1579023066141;
        Tue, 14 Jan 2020 09:31:06 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id g18sm8046403qtc.83.2020.01.14.09.31.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 09:31:05 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: linux-next: Signed-off-by missing for commit in the random tree
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200114165739.GB140865@mit.edu>
Date:   Tue, 14 Jan 2020 12:31:04 -0500
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <613F42EB-F993-4F39-AD9B-A86E06A875AA@lca.pw>
References: <20200108113953.1a92a90f@canb.auug.org.au>
 <20200114001832.GP76141@mit.edu> <20200114012221.GC202391@google.com>
 <20200114165739.GB140865@mit.edu>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Jan 14, 2020, at 11:57 AM, Theodore Y. Ts'o <tytso@mit.edu> wrote:
>=20
> On Tue, Jan 14, 2020 at 10:22:21AM +0900, Sergey Senozhatsky wrote:
>>=20
>> Oh, I didn't realize I was the author. Sorry!
>>=20
>> Sure, confirmed
>>=20
>> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
>>=20
>=20
> Hmm... the e-mail in question[1] was sent by Qian Cai, but there was a
>=20
>   From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
>=20
> in the first line of the body which attributed the patch to you.  But
> then e-mail continues:
>=20
>   Sergey didn't like the locking order .... but those code is so old,
>   and I have no clue how to de-couple it after checking other locks in
>   the splat. There is an onging effort to make all printk() as =
deferred,
>   so until that happens, workaround it for now as a short-term fix.
>=20
> So did Qian Cai author the patch, and this should have been
> "Reported-by Sergey Senozhatsky"?  In which case I need a
> Signed-off-by from Qian Cai.
>=20
> This is a pretty trivial patch, but it would be good to get the
> attributions and credit correct!
>=20
> 						- Ted
>=20
> [1] =
https://lore.kernel.org/linux-arm-kernel/1573679785-21068-1-git-send-email=
-cai@lca.pw/

It is actually Sergey proposed an informal patch here [1]. I just sent =
on
his behave and adding a commit log.

[1] https://lore.kernel.org/linux-mm/20190911011008.GA4420@jagdpanzerIV/=20=


