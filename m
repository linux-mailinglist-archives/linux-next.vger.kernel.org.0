Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B5A134EBE
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 22:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgAHVUd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 16:20:33 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:34573 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgAHVUd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jan 2020 16:20:33 -0500
X-Originating-IP: 87.231.134.186
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 65A361C0002;
        Wed,  8 Jan 2020 21:20:28 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baruch Siach <baruch@tkos.co.il>
Subject: Re: linux-next: Fixes tag needs some work in the mvebu tree
In-Reply-To: <20200109072840.0a8d1ef6@canb.auug.org.au>
References: <20200109072840.0a8d1ef6@canb.auug.org.au>
Date:   Wed, 08 Jan 2020 22:20:28 +0100
Message-ID: <87r209abmr.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

> Hi all,
>
> In commit
>
>   66f5ff1bf632 ("arm64: dts: marvell: clearfog-gt-8k: fix switch cpu port node")
>
> Fixes tag
>
>   Fixes: a612083327 ("arm64: dts: add support for SolidRun Clearfog GT 8K")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

This is fixed now,

Thanks,

Gregory
>
> -- 
> Cheers,
> Stephen Rothwell

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
