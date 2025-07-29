Return-Path: <linux-next+bounces-7748-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB0B14AEC
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 11:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B9FB3ACD3D
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 09:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1989C26B2B3;
	Tue, 29 Jul 2025 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyIN77dO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46EB1ACEDD;
	Tue, 29 Jul 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780498; cv=none; b=g2BqgZ6Z7dGgjYgzm05u/D+FmkcBfstZHJ9WRULHqewbAishL5m4P47MMi6cfY25YFE0NJfF83nngZp4w/gjhLc6BO0F2y1MUipWHIFRFvZE4x4IfwAmUGLZbG3sAXFC18U0t9lOHxRxJXM0HmbENfyNc8xMQmIgi2DVEEw11rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780498; c=relaxed/simple;
	bh=2PwsLDnqhRa8RQ2pqeVKa6zT7eDZUcQ9TKxeaHWW34g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0nnCjOGT+BxE9rJETh36oieS/7XmEPPQ1NyG6y/ZlZP5m5mGYzhPMC24rkAYtmtEZU1GHow9Vd0OJvcu6OO2M6/YqXheBS35nkkmm+u36bbkiM+7PRggpYYGzl8pYx6W/zf6Pd0igwb+0W5Z5ke8ZRndbK78MzX43PJxexUqls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyIN77dO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFDCC4CEEF;
	Tue, 29 Jul 2025 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753780497;
	bh=2PwsLDnqhRa8RQ2pqeVKa6zT7eDZUcQ9TKxeaHWW34g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyIN77dOAd+dahppuyCk5e63I8WrJCg8YLl3HU0MiwXUiknAngIfv/Aarza2Ff+my
	 iR6Q74xFv+UbRRNNZCfw7o7xXfEcVg/n1L383ycZUzov7GUTXiIqm48ytc3MRnb1ie
	 NqbQLtv1EBSaqFGToFbIQgn4/HF/hcVI10RgmmhRGvtfmVHsDRdNE6sr62v+oVrFa6
	 Xj02Mn51bPRx9ZPytiq4JUS+Z4pmQJMogWubPs5poQDO8w93ZNsMn9kHAhGizyepqY
	 vx9ioDlNQztQD9DAg+szbq4xNl/YvC2IanIP7kBka1MyWnu5zcgwCGe+fibOqA5n+m
	 SPk2qUXQc6WiQ==
Date: Tue, 29 Jul 2025 12:14:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-nonmm-unstable
 tree
Message-ID: <aIiRC8fXiOXKbPM_@kernel.org>
References: <20250729150042.77832045@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729150042.77832045@canb.auug.org.au>

On Tue, Jul 29, 2025 at 03:00:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-nonmm-unstable tree, today's linux-next build
> (x86_64 allmodconfig) produced this warning:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: kho_test_restore+0x16c (section: .text.unlikely) -> kho_test_restore_data.isra.0 (section: .init.text)
> 
> Introduced by commit
> 
>   c2d288f7ab13 ("kho: add test for kexec handover")

This should fix it. Andrew can you please add it as a fixup?

diff --git a/lib/test_kho.c b/lib/test_kho.c
index f5fe39c7c2b1..c2eb899c3b45 100644
--- a/lib/test_kho.c
+++ b/lib/test_kho.c
@@ -194,7 +194,7 @@ static int kho_test_save(void)
 	return register_kho_notifier(&kho_test_nb);
 }
 
-static int __init kho_test_restore_data(const void *fdt, int node)
+static int kho_test_restore_data(const void *fdt, int node)
 {
 	const unsigned int *nr_folios;
 	const phys_addr_t *folios_info;
 
> -- 
> Cheers,
> Stephen Rothwell

-- 
Sincerely yours,
Mike.

