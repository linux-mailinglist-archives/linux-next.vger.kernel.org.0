Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AD72A227E
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 01:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgKBAC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Nov 2020 19:02:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:59738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbgKBAC1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Nov 2020 19:02:27 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 774A622265;
        Mon,  2 Nov 2020 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604275347;
        bh=B+OLeEZbQW8DgaIiqOYdUgBv79tL9QHjFkcFrnxIV04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G1Q2fUXxdUUzcvhNDqKP0YRDEHXdSFHBOjLHNgFxTeoDmckNL+cZ+nE3a6Yj6nw0M
         21aoNZLyr+2CkljVF3hFkmLN3uOpaMtrRRlU940V2R9EhpfSN/qQSh0iD8g2Z3zNCQ
         Yd+TwmxP5CEwCZh48pKb2keGdME5Mxtssa5SOp+U=
Date:   Mon, 2 Nov 2020 08:02:22 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20201102000221.GR31601@dragon>
References: <20201102082413.0087d34b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102082413.0087d34b@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 08:24:13AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d969e9c05f83 ("ARM: dts: imx6q-prti6q: fix PHY address")
> 
> Fixes tag
> 
>   Fixes: 0d446a50559 ("ARM: dts: add Protonic PRTI6Q board")
> 
> has these problem(s):

Thanks, Stephen.  Fixed.

> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Oleksij,

Please check your git setup as suggested.

Shawn
