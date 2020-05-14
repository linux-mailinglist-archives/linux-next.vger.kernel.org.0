Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F1C1D357B
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 17:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgENPq2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 11:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgENPq1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2020 11:46:27 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92956C061A0E
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 08:46:27 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id z18so433434qto.2
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=EvtEJvAWirIZmQ1Z7jbnfUadpeoAVrZfw1XsagvgGvU=;
        b=SxDlxjrQmMi7iKIvy54Aq8ysc6IXtNTU4zH6VizVx8MeEFCNdOUG81zLx/RY+HhnM5
         MUtvVqmzDtMFFYWGH+H9BIHrMjhgg6XOf9ws18FFokyFiACkJ56gYR4V3dLAbFIam2gQ
         SPFLPxur658m9PdXybU+84o7wsi5tbldbQpIe1qJwYE8lHP4P/Vtsj5QPgOAzOAVwANx
         VG+JifixQCA5gSCG7DuCsjYCXU14ClCgCZ+s55++aAswqZCMtZbqwd2Up8HeMRE/r655
         d1Pw3wtdB6X/q3lPl+ZGl2HMqZyw+WE0PfkmoytkNUzze7xdzmYrmVlWr3kh2bUxMOmj
         JYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=EvtEJvAWirIZmQ1Z7jbnfUadpeoAVrZfw1XsagvgGvU=;
        b=DXH9ix0pttHX3XhiTCh+K25HiI7VM3PwUT5NSUJnMedeRXoTnNmhu3ab9mTml+FdVC
         pWfeQj5XnSK8+4NG1gaRECvxQEREFa83OG6ctYFpl9vvN5sxtIW8uE5xwhupCkSQKk/Z
         Us1CC1JuD91kgZIQiccXTcXlDWX2NsBFXGRZnpDf7m+UpNgr50FdDPGqXLPItqVYECD5
         GEmSVxtN64WtUqOPcgWlegg6aQICsQ1c+c0+O7bnZJ43bWQ+0kUi717qKGBqmS1S44hF
         G9M14c7ceIxG2ua+/BnoHnsOjqjUV01RmZJbUYy4fzFOrOEw1hXvAuwuZVlSpHvMthnd
         LvbA==
X-Gm-Message-State: AOAM531mNX9T9SyeVXhlg3bsml2/d9CBoUfPoPzq69j0ZIVMjhM7OA+Q
        C/s7YvIEUmJ7kAsl3TsJ+SKyyA==
X-Google-Smtp-Source: ABdhPJyL56oT0F10NB9HzzF4jSHef/mJ0f8Ab/J+5o5AMZA6se1xgSynhjMgMRo8KI44Hgyn1fXAew==
X-Received: by 2002:aed:3848:: with SMTP id j66mr5294804qte.227.1589471186484;
        Thu, 14 May 2020 08:46:26 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id f24sm293899qtq.39.2020.05.14.08.46.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 08:46:24 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200514153400.GJ2869@paulmck-ThinkPad-P72>
Date:   Thu, 14 May 2020 11:46:23 -0400
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6089C62B-52AA-47CB-BCA0-9096B3482509@lca.pw>
References: <20200514222535.259cb69e@canb.auug.org.au>
 <ADC503BE-32C0-46BB-A65E-59FFEC30ED57@lca.pw>
 <20200514133328.GG2869@paulmck-ThinkPad-P72>
 <ADE40EB3-1B1C-4CCF-9B8A-1F2BC585BCFB@lca.pw>
 <20200514135402.GI2869@paulmck-ThinkPad-P72>
 <CC392959-36FD-459F-BD13-8F50C22FC615@lca.pw>
 <20200514153400.GJ2869@paulmck-ThinkPad-P72>
To:     paulmck@kernel.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 14, 2020, at 11:34 AM, Paul E. McKenney <paulmck@kernel.org> =
wrote:
>=20
> On Thu, May 14, 2020 at 10:03:21AM -0400, Qian Cai wrote:
>>=20
>>=20
>>> On May 14, 2020, at 9:54 AM, Paul E. McKenney <paulmck@kernel.org> =
wrote:
>>>=20
>>> On Thu, May 14, 2020 at 09:44:28AM -0400, Qian Cai wrote:
>>>>=20
>>>>=20
>>>>> On May 14, 2020, at 9:33 AM, Paul E. McKenney <paulmck@kernel.org> =
wrote:
>>>>>=20
>>>>> On Thu, May 14, 2020 at 08:31:13AM -0400, Qian Cai wrote:
>>>>>>=20
>>>>>>=20
>>>>>>> On May 14, 2020, at 8:25 AM, Stephen Rothwell =
<sfr@canb.auug.org.au> wrote:
>>>>>>>=20
>>>>>>> Hi Paul,
>>>>>>>=20
>>>>>>> This patch in the rcu tree
>>>>>>>=20
>>>>>>> d13fee049fa8 ("Default enable RCU list lockdep debugging with =
PROVE_RCU")
>>>>>>>=20
>>>>>>> is causing whack-a-mole in the syzbot testing of linux-next.  =
Because
>>>>>>> they always do a debug build of linux-next, no testing is =
getting done. :-(
>>>>>>>=20
>>>>>>> Can we find another way to find all the bugs that are being =
discovered
>>>>>>> (very slowly)?
>>>>>>=20
>>>>>> Alternatively, could syzbot to use PROVE_RCU=3Dn temporarily =
because it can=E2=80=99t keep up with it? I personally found =
PROVE_RCU_LIST=3Dy is still useful for my linux-next testing, and =
don=E2=80=99t want to lose that coverage overnight.
>>>>>=20
>>>>> The problem is that PROVE_RCU is exactly PROVE_LOCKING, and asking =
people
>>>>> to test without PROVE_LOCKING is a no-go in my opinion.  But of =
course
>>>>> on the other hand if there is no testing of RCU list lockdep =
debugging,
>>>>> those issues will never be found, let alone fixed.
>>>>>=20
>>>>> One approach would be to do as Stephen asks (either remove =
d13fee049fa8
>>>>> or pull it out of -next) and have testers force-enable the RCU =
list
>>>>> lockdep debugging.
>>>>>=20
>>>>> Would that work for you?
>>>>=20
>>>> Alternatively, how about having
>>>>=20
>>>> PROVE_RCU_LIST=3Dn if DEBUG_AID_FOR_SYZBOT
>>>>=20
>>>> since it is only syzbot can=E2=80=99t keep up with it?
>>>=20
>>> Sound good to me, assuming that this works for the syzkaller guys.
>>> Or could there be a "select PROVE_RCU_LIST" for the people who would
>>> like to test it.
>>>=20
>>> Alternatively, if we revert d13fee049fa8 from -next, I could provide
>>> you a script that updates your .config to set both RCU_EXPERT and
>>> PROVE_RCU_LIST.
>>>=20
>>> There are a lot of ways to appraoch this.
>>>=20
>>> So what would work best for everyone?
>>=20
>>=20
>> If PROVE_RCU_LIST=3Dn if DEBUG_AID_FOR_SYZBOT works for syzbot guys, =
that would be great, so other testing agents could still report/fix =
those RCU-list bugs and then pave a way for syzbot to return back once =
all those false positives had been sorted out.
>=20
> On that, I must defer to the syzbot guys.
>=20
>> Otherwise,  =E2=80=9Cselect PROVE_RCU_LIST=E2=80=9D *might* be better =
than buried into RCU_EXPERT where we will probably never saw those false =
positives been addressed since my configs does not cover a wide range of =
subsystems and probably not many other bots would enable RCU_EXPERT.
>=20
> Yet another option would be to edit your local =
kernel/rcu/Kconfig.debug
> and change the code to the following:
>=20
> 	config PROVE_RCU_LIST
> 		def_bool y
> 		help
> 		  Enable RCU lockdep checking for list usages. It is =
default
> 		  enabled with CONFIG_PROVE_RCU.
>=20
> Removing the RCU_EXPERT dependency would not go over at all well with
> some people whose opinions are difficult to ignore.  ;-)

I am trying to not getting into a game of carrying any custom patch =
myself.

Let=E2=80=99s see what syzbot guys will say, and then I=E2=80=99ll =
enable RCU_EXPERT myself if needed, but again we probably never see =
PROVE_RCU_LIST to be used again in syzbot for this path. I surely have =
no cycles to expand the testing coverage for more subsystems at the =
moment.

