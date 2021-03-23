Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E1F346DAE
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 00:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbhCWXDH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 19:03:07 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34464 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234105AbhCWXCy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 19:02:54 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A8F371A2322;
        Wed, 24 Mar 2021 00:02:48 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9BA1B1A2319;
        Wed, 24 Mar 2021 00:02:48 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7CFA2202A9;
        Wed, 24 Mar 2021 00:02:48 +0100 (CET)
Date:   Wed, 24 Mar 2021 01:02:48 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: bad topic branch merged into the clk-imx tree
Message-ID: <20210323230248.jij26abxkqkq464l@fsr-ub1664-175>
References: <20210324090243.6523cf32@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324090243.6523cf32@canb.auug.org.au>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 21-03-24 09:02:43, Stephen Rothwell wrote:
> Hi all,
> 
> Please try to avoid merging branches based on v5.12-rc1-dontuse - ask
> the branch owner to rebase onto (at least) v5.12-rc2.
> 

Oups, fixed now.

> -- 
> Cheers,
> Stephen Rothwell


