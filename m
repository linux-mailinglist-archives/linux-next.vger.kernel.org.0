Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A941D320E
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 16:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgENOD0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 10:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726037AbgENOD0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 10:03:26 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1ADC061A0E
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 07:03:24 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id a136so3039489qkg.6
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DPPma3BWcIsf3J/I70N8Nn3h+M8824Udo5W6dirat1Q=;
        b=gYeH/EbnoXl71eid3pRmazK7xy05PoyQl4HRdQVxqc3vUTmfBZVm9mX8lKWNLWkS9W
         0g3moK8CoN2hVva4yEIlApR1lxdLjtLTKKwduXuSnphKSuR1+nZP58OquuLTWh7djnNq
         opJ+ui5SlJPvbZPokEDbddfDUxGwaPThaNyeWfGSxOxpCIa1EEatvy082rKKhmVJAGM1
         FNLOxXGfj9+Hiu8SAoQvjk58tPQisRePOCGIqtimdEnhlLV1HO6GSy7houWypJKmcYK+
         YDa/SmNui5MHlfB5K80qDpWGHNntYbYLMjhBFThcth4RwTTXXtqUjsOokOTtc73nsa+/
         LpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DPPma3BWcIsf3J/I70N8Nn3h+M8824Udo5W6dirat1Q=;
        b=Pn/Xniqh8p5jnPfM/XKVJOnyjlSQZTDQOeoW+dXJKR8cavstEjeVTC/eM7ltxO/D9k
         ByWFoTXVYg1J110/d/dcLGe+CXE6PQGQb3rZEDml9ZZSPEV2nIYJmtadWh1oR1wcT8W7
         AqYdLaJG8xdAw/Jmt6f1xtsXo6wS4QVt9YlBo3hlnpzHJ5WcSDK8iZGqUxo2rNCMo0yw
         zNTD8NGiG/zciqqafA/82rHMV1hav5VLYKOHGJ0wrLryZcm5ufskgatss7b5ZyfwhE9+
         wmVIQhKVZO1NCoboR2ERWOqbkXqmC/EtJWzl0phi7nZME59wVHj2VrhzKd3Ziqe0a+/n
         GSEg==
X-Gm-Message-State: AOAM532fc4xP685VkBVUu6vlWHKzPCrXrxrh453PoS9VncwnWRBT2QcU
        hDNRcKghLmy00Mnc73v+cKHQRJrjBaM6kw==
X-Google-Smtp-Source: ABdhPJyXJtAqYOZRYhFZ7uYjxNZfKgwQhSgvkhQokfCdKf9HbVI5MRMO3cZ7ualj7v4u6dbRGv3N7w==
X-Received: by 2002:a37:658a:: with SMTP id z132mr4906470qkb.267.1589465002907;
        Thu, 14 May 2020 07:03:22 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id k138sm2650919qke.55.2020.05.14.07.03.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 07:03:22 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200514135402.GI2869@paulmck-ThinkPad-P72>
Date:   Thu, 14 May 2020 10:03:21 -0400
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC392959-36FD-459F-BD13-8F50C22FC615@lca.pw>
References: <20200514222535.259cb69e@canb.auug.org.au>
 <ADC503BE-32C0-46BB-A65E-59FFEC30ED57@lca.pw>
 <20200514133328.GG2869@paulmck-ThinkPad-P72>
 <ADE40EB3-1B1C-4CCF-9B8A-1F2BC585BCFB@lca.pw>
 <20200514135402.GI2869@paulmck-ThinkPad-P72>
To:     "Paul E. McKenney" <paulmck@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 14, 2020, at 9:54 AM, Paul E. McKenney <paulmck@kernel.org> =
wrote:
>=20
> On Thu, May 14, 2020 at 09:44:28AM -0400, Qian Cai wrote:
>>=20
>>=20
>>> On May 14, 2020, at 9:33 AM, Paul E. McKenney <paulmck@kernel.org> =
wrote:
>>>=20
>>> On Thu, May 14, 2020 at 08:31:13AM -0400, Qian Cai wrote:
>>>>=20
>>>>=20
>>>>> On May 14, 2020, at 8:25 AM, Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>>>>=20
>>>>> Hi Paul,
>>>>>=20
>>>>> This patch in the rcu tree
>>>>>=20
>>>>> d13fee049fa8 ("Default enable RCU list lockdep debugging with =
PROVE_RCU")
>>>>>=20
>>>>> is causing whack-a-mole in the syzbot testing of linux-next.  =
Because
>>>>> they always do a debug build of linux-next, no testing is getting =
done. :-(
>>>>>=20
>>>>> Can we find another way to find all the bugs that are being =
discovered
>>>>> (very slowly)?
>>>>=20
>>>> Alternatively, could syzbot to use PROVE_RCU=3Dn temporarily =
because it can=E2=80=99t keep up with it? I personally found =
PROVE_RCU_LIST=3Dy is still useful for my linux-next testing, and =
don=E2=80=99t want to lose that coverage overnight.
>>>=20
>>> The problem is that PROVE_RCU is exactly PROVE_LOCKING, and asking =
people
>>> to test without PROVE_LOCKING is a no-go in my opinion.  But of =
course
>>> on the other hand if there is no testing of RCU list lockdep =
debugging,
>>> those issues will never be found, let alone fixed.
>>>=20
>>> One approach would be to do as Stephen asks (either remove =
d13fee049fa8
>>> or pull it out of -next) and have testers force-enable the RCU list
>>> lockdep debugging.
>>>=20
>>> Would that work for you?
>>=20
>> Alternatively, how about having
>>=20
>> PROVE_RCU_LIST=3Dn if DEBUG_AID_FOR_SYZBOT
>>=20
>> since it is only syzbot can=E2=80=99t keep up with it?
>=20
> Sound good to me, assuming that this works for the syzkaller guys.
> Or could there be a "select PROVE_RCU_LIST" for the people who would
> like to test it.
>=20
> Alternatively, if we revert d13fee049fa8 from -next, I could provide
> you a script that updates your .config to set both RCU_EXPERT and
> PROVE_RCU_LIST.
>=20
> There are a lot of ways to appraoch this.
>=20
> So what would work best for everyone?


If PROVE_RCU_LIST=3Dn if DEBUG_AID_FOR_SYZBOT works for syzbot guys, =
that would be great, so other testing agents could still report/fix =
those RCU-list bugs and then pave a way for syzbot to return back once =
all those false positives had been sorted out.

Otherwise,  =E2=80=9Cselect PROVE_RCU_LIST=E2=80=9D *might* be better =
than buried into RCU_EXPERT where we will probably never saw those false =
positives been addressed since my configs does not cover a wide range of =
subsystems and probably not many other bots would enable RCU_EXPERT.=
