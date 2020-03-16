Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3EE8186719
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 09:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbgCPIzU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 04:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730110AbgCPIzU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 04:55:20 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C15820663;
        Mon, 16 Mar 2020 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584348919;
        bh=E6VIykSazL12IwA7Ptf9fe4mIKwhaaWu+UvPV7j9K2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wuYxpJacv9Vx1vHIn8zR/UhB8YK3VVISIVXCa/Rb6GBySbrKiTw3eOIfpPV2b+EPW
         ng2MjfZ+Lw/UpMwqqPuk1fxkMuC/Pse0c2sOlDCjbyHuGfrWHbJcqq5oZTYcHd5enI
         fgdYB8YpnazBfyZPuCUdUSeKez94ZW+QszznpRck=
Date:   Mon, 16 Mar 2020 16:55:14 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20200316085512.GK17221@dragon>
References: <20200316184331.27d43eaa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316184331.27d43eaa@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 06:43:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   c258dccaf994 ("arm64: dts: imx8m: fix aips dts node")
> 
> is missing a Signed-off-by from its committer.

Oops!  Fixed.  Thanks, Stephen.

Shawn
