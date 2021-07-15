Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AB43C9D65
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 13:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbhGOLEW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jul 2021 07:04:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235517AbhGOLEW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jul 2021 07:04:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E24FB613BA;
        Thu, 15 Jul 2021 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626346889;
        bh=nSeG12PirYlnAlLJiFfuEZLYR+TEKgJoUNZFkdXkew0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WZyocnL6pfvur86PtSijWfZMEhhsj4gCAjIld2CKNNL702a7chIbaTqKNbHJGiSuz
         QgHkJ6Ao86rs8vvhXw6lnMidl7yfRszyEBzVBLKnlzO89ZL6goJM5Acz1JOemj/A/n
         lM8cfg2RPTYubCQzehyQnTUQKVSpGetLOgWgPyLTfhOurkMiUkWuDcU+Fp76Os+ZpD
         t7KwuwrPAoMJPdIYXbxLH4f3q75R23dEdC8f2gpU/ttha7rsRJQP4eRr4GOMbGWU12
         QX02YxRjdESOWU+Aayoehtm2usMBvgduv/AJJQnLz8ZntlqBgGCPVWiPDJJ1WnAEcr
         gDr8Tm5LxRlYg==
Date:   Thu, 15 Jul 2021 19:01:25 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20210715110124.GA11388@dragon>
References: <20210715080617.28efa29b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715080617.28efa29b@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 15, 2021 at 08:06:17AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   857e67e935b7 ("ARM: dts: add SolidRun SolidSense support")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks!

Shawn
