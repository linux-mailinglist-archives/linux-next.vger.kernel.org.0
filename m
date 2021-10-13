Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59AC42CD98
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 00:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhJMWOj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 18:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhJMWOi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2021 18:14:38 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09326C061570;
        Wed, 13 Oct 2021 15:12:35 -0700 (PDT)
Received: from crub (pd95f1d7c.dip0.t-ipconnect.de [217.95.29.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: agust@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8D8E181761;
        Thu, 14 Oct 2021 00:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634163153;
        bh=vDzTdSOJ5R5ENuBq/d0LcDdztJjFAHgx46FobxeyMS8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B+fZN8q1o1HRGh4yn42cK/RRHKOEg5c3cOTsMK/dzaae2o56wpiUrJy/V/tlG49+5
         Q+B9DR9LUi8Cc+5wZI8FrvEUieXsh4PiCllh9wpxB/rdmS2UJ0G/gUdjPYSuNq5fMS
         tnvnpFcPL5Sv29Hh4plzOlngnZOhoL7fP67h7CnQ2jIm+Om9aYM46gAoPtbnUN4XXd
         Mp74ybMfij+E4DhTmPpXTkQe9KHrHkcOw2nVp7fIF1Ypsm9ZwRderNQhPl5w1WE6on
         vZBB0+XUQAIiL7C5p+GutuNQwHX2cJMrjRoTgP7Z1eSuJidGeSovnE3oNNhbm8D1Tn
         J3jKVijtJNxdw==
Date:   Thu, 14 Oct 2021 00:12:32 +0200
From:   Anatolij Gustschin <agust@denx.de>
To:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20211014001232.3becbe99@crub>
In-Reply-To: <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
References: <20211008164728.30e3d3a3@canb.auug.org.au>
        <20211011082704.3cff4568@canb.auug.org.au>
        <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
        <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arnd, Rob,

On Tue, 12 Oct 2021 16:39:56 +0200
Arnd Bergmann arnd@arndb.de wrote:
...
>Grant Likely was the original maintainer for MPC52xx until 2011,
>Anatolij Gustschin is still listed as maintainer since then but hasn't
>been active in it for a while either. Anatolij can probably best judge
>which of these boards are still in going to be used with future kernels,
>but I suspect once you start removing bits from 52xx, the newer
>but less common 512x platform can go away as well.

many of these boards are still used, i.e. o2d*, digsy_mtc, tqm5200.
I've sent first series to fix some warnings. Other dts fixes
require driver changes, so it will take some time to fix them.

Anatolij
