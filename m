Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE691D0577
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 05:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgEMDUZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 23:20:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMDUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 23:20:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67E6420718;
        Wed, 13 May 2020 03:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589340024;
        bh=QM6wYalvcbWtwF5fby2SPnx+NbpXHDyRdSzRSoHFRas=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kJRR6ClzOaY1Qfz1FAGcHFurZ5dSIeoNKiGYgIY8aFIqCcIENtNQc9HFOkZ/pn3w5
         IiUWFC1232Sdkk7gXs7lWHS94b6rATk3qj/9uuNk0IQLiJth8byQmBc0Glx+mK2+OH
         P78Q9fYnUdpDX8UJQG0jiV7FXtSeytdrG6ksSf8c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200511105556.5b13a4b4@canb.auug.org.au>
References: <20200511105556.5b13a4b4@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the clk tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue, 12 May 2020 20:20:23 -0700
Message-ID: <158934002362.215346.193807448749037189@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-05-10 17:55:56)
> Hi all,
>=20
> After merging the clk tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> arch/arm/mach-mmp/time.c:37:10: fatal error: clock.h: No such file or dir=
ectory
>    37 | #include "clock.h"
>       |          ^~~~~~~~~
>=20
> Caused by commit
>=20
>   e4d1fdf89751 ("ARM: mmp: Remove legacy clk code")
>=20
> I have disabled CONFIG_ARCH_MPP for today.  (For some reason, this
> build error did not show up until several more trees had been merged

Thanks. I see this error so it must be something on my end.
