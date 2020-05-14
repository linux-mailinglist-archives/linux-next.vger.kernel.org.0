Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D521D317C
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 15:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgENNjs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 09:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727802AbgENNjr (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 09:39:47 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58102C061A0E
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 06:39:47 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id i68so2828325qtb.5
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PtDz09LOkzjvvCoePxmt7faUO189OcHyAGB4NVnPo5w=;
        b=gORtbmNVZ0Y3FHE3lSOmGqP8TsAqKnlxgjygjNH7i2lySpuRefvl1jHY9s4YyfWrxC
         RC0G+/jSxogr6BYMwylaHcIVQ9jy5LwaIyrJdjVKuBAeqkUbFz+3jsRgPZDzDIyEEPs6
         cwmXNypii2MfKzOiHOz+kNLlojd2Br3HySJpion7+mGsxcpHEd/Yk0UXksIwr0W2FjfA
         zuvSxT+a6xvbOXFmIzqiGaFhpSKu1+dOsEvjcO8lQCSQkgiVzYd2TyBVmATC1wICbOEI
         g1MVR9XXV+A3j9EXu75u01JDvL75HnhZOLn+HtdnD0dL45zBwNHxfsP665gGuSUsPRQr
         FMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PtDz09LOkzjvvCoePxmt7faUO189OcHyAGB4NVnPo5w=;
        b=TlTlFRUh0Ja8O34+l/GrbxdtCjF/wYquOd2MT9txy13S8JGalnapa6XKHGdCr2lf0j
         oksEwNC0Inb22JDgQrFVvofvWr+0h/AioGmH3pcMSbnnojRPnq7ImhSM92SzuG38MS3f
         3BhShQzadp38D0tVAb75xMC3Xh0V3th6358hrGk4/HELfR676PNrGItsUri4QYVJXInr
         5OdYKkMjoEC4qNX7lJsXwZFGV/s1AeqTSHePEigMSq6O8YM2OEhAIBc3Jshobc7yIeSZ
         7Gol6B/Jvl9xbOpcyA9pQxGNZq+PTivTsXOiOZovhXZrmYU5BmgeSMUWn381xclPHAmT
         dh3w==
X-Gm-Message-State: AOAM533YFHCo3qE4Lq0ZPnz34BdFvpKJFo6QNYX6c7d73c5j5K6/RMWm
        J3b0airuju0vvWGQ0Arj76aMDg==
X-Google-Smtp-Source: ABdhPJx7yVlRhp+tedZEgwXP0IGx4ag09z1dk2lWXiNjPqX+eufFanUNRCkK22YEmEyXevqtpSezwQ==
X-Received: by 2002:aed:308e:: with SMTP id 14mr4532096qtf.146.1589463586413;
        Thu, 14 May 2020 06:39:46 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id i5sm2497041qtp.66.2020.05.14.06.39.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 06:39:45 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200514133328.GG2869@paulmck-ThinkPad-P72>
Date:   Thu, 14 May 2020 09:39:45 -0400
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4D24E8F-091D-4E89-993B-B8B2E68D6E2B@lca.pw>
References: <20200514222535.259cb69e@canb.auug.org.au>
 <ADC503BE-32C0-46BB-A65E-59FFEC30ED57@lca.pw>
 <20200514133328.GG2869@paulmck-ThinkPad-P72>
To:     "Paul E. McKenney" <paulmck@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 14, 2020, at 9:33 AM, Paul E. McKenney <paulmck@kernel.org> =
wrote:
>=20
> On Thu, May 14, 2020 at 08:31:13AM -0400, Qian Cai wrote:
>>=20
>>=20
>>> On May 14, 2020, at 8:25 AM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>>>=20
>>> Hi Paul,
>>>=20
>>> This patch in the rcu tree
>>>=20
>>> d13fee049fa8 ("Default enable RCU list lockdep debugging with =
PROVE_RCU")
>>>=20
>>> is causing whack-a-mole in the syzbot testing of linux-next.  =
Because
>>> they always do a debug build of linux-next, no testing is getting =
done. :-(
>>>=20
>>> Can we find another way to find all the bugs that are being =
discovered
>>> (very slowly)?
>>=20
>> Alternatively, could syzbot to use PROVE_RCU=3Dn temporarily because =
it can=E2=80=99t keep up with it? I personally found PROVE_RCU_LIST=3Dy =
is still useful for my linux-next testing, and don=E2=80=99t want to =
lose that coverage overnight.
>=20
> The problem is that PROVE_RCU is exactly PROVE_LOCKING, and asking =
people
> to test without PROVE_LOCKING is a no-go in my opinion.  But of course
> on the other hand if there is no testing of RCU list lockdep =
debugging,
> those issues will never be found, let alone fixed.
>=20
> One approach would be to do as Stephen asks (either remove =
d13fee049fa8
> or pull it out of -next) and have testers force-enable the RCU list
> lockdep debugging.
>=20
> Would that work for you?

Yes, if there is a way to enable PROVE_RCU_LIST=3Dy manually, that is =
fine. I think we would want to make it easier to enable it. Currently, =
it is buried into RCU_EXPERT?=
