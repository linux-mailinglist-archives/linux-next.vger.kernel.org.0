Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE641EEEEE
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 03:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgFEBIW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 21:08:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgFEBIW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Jun 2020 21:08:22 -0400
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40FDC206A2;
        Fri,  5 Jun 2020 01:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591319302;
        bh=J/UgPloqDehOpWWxRSezIJjhVQzLn6+WD/FsIH7lUys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kfW/oP5L+l9jNe2zJ8+cWu5rYbGWN7u6hgqNF+5bT1eCfr+yPaMETizKTwipuVHYO
         uVT+7T3mIETXizvvhCCCtIIRRkyvHq3SQqiLuCvahiUvV0wu9KEbb7nPGqRD24B8Cc
         /VhADm6odczU5uZBX8/51NPYkbJXDb5R3UVfaZvU=
Date:   Thu, 4 Jun 2020 18:08:21 -0700
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <20200605010821.GA100890@google.com>
References: <20200605100430.0ed7de60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605100430.0ed7de60@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 06/05, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   35942e2134fa ("f2fs: attach IO flags to the missing cases")
> 
> Fixes tag
> 
>   Fixes: d58f2f658159 ("f2fs: add node_io_flag for bio flags likewise data_io_flag")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 4a6183fb7db6 ("f2fs: add node_io_flag for bio flags likewise data_io_flag")

Ah, both are in dev branch. Let me drop the Fixes tag.

> 
> -- 
> Cheers,
> Stephen Rothwell


