Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344BC32BB78
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347282AbhCCM3k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842904AbhCCKWP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 05:22:15 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABC3C08EB2D;
        Wed,  3 Mar 2021 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=SVv+ZnIXJHfmfGHOs6kF4sffZ6um7ub7BvAp8uvXGp4=; b=Vd9Kj9fscK/x8E19uzOwzZzoHt
        t3orsPzowVCn2uyUTMb8iasQKJNwR2KnaS0ERk3wgTx8Ak5PyLoVlQ5/0X/tVO9exYIXXoLm7oRgV
        YvMMhOhb2M4GJGPpOL8dMI54Y7bML2vbml0OTePssRz14EruqbHLmnrq7qAd2pghn3c+GSPgLU6Ep
        9uR1XcVc8WKwvnZ1zVH4+DEAj01giZXm4eaiPQ1uS4Ve7I4jli4JESJGn22jf6tlNiTWFoTviqC0o
        3zfGvBaK0SYOTawouXM3Ye/8DPZlbmnGjlaV1/UP55iWzprY1/n6soEnExd4gz4ly1vApysah5B1A
        nP/T9IaQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHO3Z-0023Xu-Al; Wed, 03 Mar 2021 09:44:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7A5213017B7;
        Wed,  3 Mar 2021 10:44:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 326CB264F0E2E; Wed,  3 Mar 2021 10:44:32 +0100 (CET)
Date:   Wed, 3 Mar 2021 10:44:32 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YD9agIC1d6bOGYu3@hirez.programming.kicks-ass.net>
References: <20210303103842.1a0ccc8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210303103842.1a0ccc8f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 03, 2021 at 10:38:42AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from drivers/usb/usbip/usbip_common.c:18:
> drivers/usb/usbip/usbip_common.h: In function 'usbip_kcov_handle_init':
> drivers/usb/usbip/usbip_common.h:348:20: error: implicit declaration of f=
unction 'kcov_common_handle' [-Werror=3Dimplicit-function-declaration]
>   348 |  ud->kcov_handle =3D kcov_common_handle();
>       |                    ^~~~~~~~~~~~~~~~~~
> drivers/usb/usbip/usbip_common.h: In function 'usbip_kcov_remote_start':
> drivers/usb/usbip/usbip_common.h:353:2: error: implicit declaration of fu=
nction 'kcov_remote_start_common' [-Werror=3Dimplicit-function-declaration]
>   353 |  kcov_remote_start_common(ud->kcov_handle);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/usbip/usbip_common.h: In function 'usbip_kcov_remote_stop':
> drivers/usb/usbip/usbip_common.h:358:2: error: implicit declaration of fu=
nction 'kcov_remote_stop'; did you mean 'usbip_kcov_remote_stop'? [-Werror=
=3Dimplicit-function-declaration]
>   358 |  kcov_remote_stop();
>       |  ^~~~~~~~~~~~~~~~
>       |  usbip_kcov_remote_stop
>=20
> Caused by commit
>=20
>   eae7a59d5a1e ("kcov: Remove kcov include from sched.h and move it to it=
s users.")
>=20
> I have used the tip tree from next-20210302 for today.

Damn, sorry about that. I've rebased tip/sched/core and all should be
well now.
