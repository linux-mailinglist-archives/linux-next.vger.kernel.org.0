Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE391EC273
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 21:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbgFBTMv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 15:12:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgFBTMu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 15:12:50 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 210B4206E2;
        Tue,  2 Jun 2020 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591125169;
        bh=KytOgv9GEW1W76zTxo2ICGkgqWTsLMSuLcI5HtKPV6k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X5lsBBpbW70dz0E7pzkh/35XmnX90GCyjDcSKef1/YrEBsWABbFkNd3D5kT1Cw/fD
         VHccLlP201viSu2rZMNy7exbGZ1c87g0zXdJRK8ysvnAYFrE+Ea2wMRovJ7n6qBeQc
         4xj51ID/wxy3vvJpomUC0S+DjUbeVhzdnoq99W3E=
Date:   Tue, 2 Jun 2020 12:12:48 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-Id: <20200602121248.155dbdd4f2901f366481bdd1@linux-foundation.org>
In-Reply-To: <20200602195741.4faaa348@canb.auug.org.au>
References: <20200602195741.4faaa348@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2 Jun 2020 19:57:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Subject: [PATCH] turns out that probe_user_write is used in modular code
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/maccess.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/maccess.c b/mm/maccess.c
> index ddfda8e6f4a5..88845eda5047 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -246,6 +246,7 @@ long probe_user_write(void __user *dst, const void *src, size_t size)
>  		return -EFAULT;
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(probe_user_write);

Thanks, I shall squish that in and make the appropriate changelog update.
