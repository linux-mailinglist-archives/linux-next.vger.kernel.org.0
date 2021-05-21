Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7CF38C8AC
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 15:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhEUNwQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 09:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhEUNwP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 09:52:15 -0400
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF284C061574;
        Fri, 21 May 2021 06:50:52 -0700 (PDT)
Received: by fieldses.org (Postfix, from userid 2815)
        id 7C1612839; Fri, 21 May 2021 09:50:51 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 7C1612839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
        s=default; t=1621605051;
        bh=pv98R9t2GquOua9zes0Gc4zkTACFSz3GpMYD0W+jK0Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O0QSlwxWPgyfKefk+n4QoXhqfWJilRf/tVPcMWgImjrrolnJzMahFRB7mh6MWQyq0
         F5OmWr3LaJD6+AINhSeKhfw0Q8t1gmDedFSLlCS1c6PBHBg2dHAIjS3VwPY33ZK8IY
         zuERhudbzUQT24mU7JsL4eFXLQnVZX+lKNdXF5iM=
Date:   Fri, 21 May 2021 09:50:51 -0400
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olga Kornievskaia <kolga@netapp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20210521135051.GA30314@fieldses.org>
References: <20210521080416.45f06cb8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521080416.45f06cb8@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 21, 2021 at 08:04:16AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   ff78b9442926 ("NFSD add vfs_fsync after async copy is done")
> 
> is missing a Signed-off-by from its author.

Olga, can I add

	Signed-off-by: Olga Kornievskaia <kolga@netapp.com>

?

--b.
