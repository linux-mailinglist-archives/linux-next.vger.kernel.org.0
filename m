Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2617A161C64
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 21:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgBQUmj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 15:42:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727300AbgBQUmj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Feb 2020 15:42:39 -0500
Received: from linux-8ccs (p5B2812F9.dip0.t-ipconnect.de [91.40.18.249])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75B4E20801;
        Mon, 17 Feb 2020 20:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581972158;
        bh=krgoKyCV0giz5SQb9qHccoL24ZmlI7+9o/yAL45tIVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0V+Ekr1Xw8W/xyOJQ4d017IcqTclmSHITqsG/6kZNWxBxlPU3vLk9DqrNhfl/0Zkx
         JtlbfsjJlNUwce8lY01uiLKp9NCaHePjfLfFqzPnZXUzMeo4A0hoeBXbWizs1MT0El
         epc4Pgk+XoLdGZqPS6biYfja04Xhk8oFx6nzjnCA=
Date:   Mon, 17 Feb 2020 21:42:34 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the modules tree
Message-ID: <20200217204233.GA26750@linux-8ccs>
References: <20200218073843.26b45f1b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200218073843.26b45f1b@canb.auug.org.au>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Stephen Rothwell [18/02/20 07:38 +1100]:
>Hi all,
>
>Commit
>
>  b99931f169fe ("kernel: module: Replace zero-length array with flexible-array member")
>
>is missing a Signed-off-by from its committer.

Gah sorry, that's fixed now. 

Thanks!

Jessica
