Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD63436D85
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 00:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhJUWhg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 18:37:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:39340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhJUWhf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Oct 2021 18:37:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEC486128E;
        Thu, 21 Oct 2021 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634855718;
        bh=kYQhesY46TF4greDxHbXY7Kv+lkj2gF2rCoYMlwLamw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cwk6QkSAwKxlIh9JRxi6ic02ZckciyjVdNt15R55SgRUROvJhqc2mr4v5+TsX3eDV
         o9hPA957gLn5z7o8xHNN9vrvy/LeFgSJfySkrWeScEEvtLZIpgtCKQEcB0jBUqpBFZ
         rx/IuI6vkskYein2I+WPwMUhFgNVCn07N4o5CFlhjUv2G0GOn3ZM/9vtNDHx7hgRNT
         WE+6afEU6jCmTod9aKKJEv9MOONj85PkLFP7lnaS3RqW0dBvS+VpQPlZTd1xwiVAM8
         oMaH4Sz6yV+knHssfRQkJMHCr4hdK9uFNDVI9H/VLIMt37b8u4B8GisB22Hm40kCRg
         RTeEX/mKBu/qQ==
Date:   Thu, 21 Oct 2021 15:35:17 -0700
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daeho Jeong <daehojeong@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <YXHrJWThIgUF/DJC@google.com>
References: <20211022093145.3b816875@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022093145.3b816875@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   701179c15976 ("f2fs: include non-compressed blocks in compr_written_block")
> 
> Fixes tag
> 
>   Fixes: commit 5ac443e26a09 ("f2fs: add sysfs nodes to get runtime compression stat")
> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected

Fixed. Thanks.

> 
> -- 
> Cheers,
> Stephen Rothwell


