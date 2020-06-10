Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63741F5E52
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 00:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgFJW1u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 18:27:50 -0400
Received: from muru.com ([72.249.23.125]:57614 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726544AbgFJW1u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jun 2020 18:27:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7A0558081;
        Wed, 10 Jun 2020 22:28:40 +0000 (UTC)
Date:   Wed, 10 Jun 2020 15:27:46 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the omap-fixes
 tree
Message-ID: <20200610222746.GD43721@atomide.com>
References: <20200610083956.21820d73@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610083956.21820d73@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [200609 22:40]:
> Hi all,
> 
> Commits
> 
>   e711da8e6306 ("ARM: dts: am437x-epos-evm: remove lcd timings")
>   02d1ba4bdba0 ("ARM: dts: am437x-gp-evm: remove lcd timings")
>   dc7677dbb854 ("ARM: dts: am437x-sk-evm: remove lcd timings")
> 
> are missing a Signed-off-by from their committer.

Thanks I'll fix that.

Regards,

Tony
