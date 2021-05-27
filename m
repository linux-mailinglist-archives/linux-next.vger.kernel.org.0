Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF57392E07
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 14:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbhE0Me3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 27 May 2021 08:34:29 -0400
Received: from muru.com ([72.249.23.125]:32864 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234904AbhE0Me3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 May 2021 08:34:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D5B4380A8;
        Thu, 27 May 2021 12:33:01 +0000 (UTC)
Date:   Thu, 27 May 2021 15:32:52 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the omap-fixes
 tree
Message-ID: <YK+RdN05hCq8j3aL@atomide.com>
References: <20210527074007.462e1167@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210527074007.462e1167@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [210526 21:40]:
> Hi all,
> 
> Commit
> 
>   1e195f9cef08 ("ARM: OMAP1: ams-delta: remove unused function ams_delta_camera_power")
> 
> is missing a Signed-off-by from its committer.

Oops --sign was missing while applying, fixed now.

Tony


