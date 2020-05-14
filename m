Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB371D3193
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 15:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgENNoa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 09:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726316AbgENNoa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 09:44:30 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48223C061A0C
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 06:44:30 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id g20so1658658qvb.9
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 06:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dlxN/PpfiP8tIFd7R5Dc8269kTO8d9dd96s9WzU8Rj0=;
        b=CEMXm9EHcJiHDy6bUXbSgkvcdeUGIBFMcAhgbN0gvwFozLEeMRaIWTBnPVzq+UBqhP
         pEAhEngd2ZcPWgH2HPVvFro4FVpzu88vhP3xmUyIqpBjrHf4Hfz3MOeIT5BiEbXspOm6
         COekWoEQCZtSfhl1nThKzxHbPtcCy6Sj8QNNvXn+kLfwmQPn7ItrupSRebYxOgkYViR4
         WIQbS4ksrmnmmQUvRtVP/qvQyJzDrsqgXbP37YDy8hx+7wm+msyxx73Sm2dr+HfabrTE
         TvRZdYZkssbXIbWBJBJAYEcw91Eh9dck5d0ZZ6bs0VhkwBA88tSLxiQ3BD1CxMz9SoNT
         C4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dlxN/PpfiP8tIFd7R5Dc8269kTO8d9dd96s9WzU8Rj0=;
        b=sCOEMtwEsUyVVHov7tQTk/FCQ0aESomlC393yDyaloj9hvRqhhhjmhezr3WkssNaoZ
         soxmgzHvsWldUp0vJiJcLsZKC9tKOsgprHfYHpT65SY+DGpNom8VduCme/biLDVOZXbP
         FzUY0ZUTUMb3dfbmhdyJucv7Qx1Zt2LrB0lDsJOVok72ILc6QY/+QCXDEHJOHEf72IKc
         0dVv/a2ewVaZjlRT7TDGzFE8CO4cQMraL/Yi8OliW/zx/EBKfrxQ+nrhXe0KsUp6Rnw3
         CKHkc9m6XcRTjAPZhvRXRQRp45foPgEIdcjzq65cVcQND5/CJo2GS9EKjqe3MBaDPCXu
         S0Eg==
X-Gm-Message-State: AOAM5308l/I+yRGcMjIukUnqA2kPq82UsAvEMz0DhDcLsu9iGhtTTe1q
        DWz+m4cYJASpVlMVQyyK1ULUrQ==
X-Google-Smtp-Source: ABdhPJwokfC2Pg3Cb5HGTztkwAl/QLsAKO/vh2sOCqcbjXxLaJxBzmqDWu/H3l2e5NnNOdgrmSqLoQ==
X-Received: by 2002:ad4:42a5:: with SMTP id e5mr4912474qvr.234.1589463869478;
        Thu, 14 May 2020 06:44:29 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id m59sm2603015qtd.46.2020.05.14.06.44.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 06:44:28 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200514133328.GG2869@paulmck-ThinkPad-P72>
Date:   Thu, 14 May 2020 09:44:28 -0400
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ADE40EB3-1B1C-4CCF-9B8A-1F2BC585BCFB@lca.pw>
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

Alternatively, how about having

PROVE_RCU_LIST=3Dn if DEBUG_AID_FOR_SYZBOT

since it is only syzbot can=E2=80=99t keep up with it?=
