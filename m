Return-Path: <linux-next+bounces-9760-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNlADo68b2kOMQAAu9opvQ
	(envelope-from <linux-next+bounces-9760-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 18:34:06 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89748A37
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 18:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44CC5A04FB5
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 16:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A5D30F942;
	Tue, 20 Jan 2026 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IDQ9VDUS";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9BKoLFiX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IDQ9VDUS";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9BKoLFiX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329830CD8F
	for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925923; cv=none; b=Si0O1s35v7mO5RMuFgHUWLulYNVo0nR2RgsRRHkNYdW0/0DA0VgYPLyrrE7Av91qRxk9EfWutce2E+iSm/GALe7pjnBgtkZWBntldU4ufHBU2C2Yc1CAyKcStM+cHoYRVNmimGqRMedkCcDvdUcr3j2ZRta9FFXwHVW7jl2WjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925923; c=relaxed/simple;
	bh=ay+mAB4OAWIAt0PTRKLfWJbvVVq4Ty2SCPKgglkEORw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6No4ByEt+KWfy5X30LoTwJ1ijTWG9BsPWyFgH/VNy2EjNycFsJjKr4ERE7Gra/r8TkQCKo78byc0xDA/koxuNuloVgIDBtoc5XQVCb4hao57S31rX8Vcdk7KDeAuQCDUdC+IBJB/kGQgJHfCEkiB98C4XlszkaAA1Ox5pjPANQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IDQ9VDUS; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9BKoLFiX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IDQ9VDUS; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9BKoLFiX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35645337C9;
	Tue, 20 Jan 2026 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=IDQ9VDUSJQMx/c8IO3huYsiqjvV3BuAQhsNwu72YuhKpqeBM1wkvAPY1w0/iZQYMv5wu1/
	gQpyZaup+sVXPwfQ/tdlrojBYGUNJhau8TIwfizlJHoSOmdfcih2AkYt1qdQZsCRkQDAZW
	l4eJoaj6Ae/2o8kqYqBHhQnu3GNAp98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=9BKoLFiXJTEdPlWa6SCTRstvLRBqZDSmag8zKhq+Jtc7n2hVIpqrNJM3ySLzGKhdLsj7QX
	5TnJNv/22yf79CCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=IDQ9VDUSJQMx/c8IO3huYsiqjvV3BuAQhsNwu72YuhKpqeBM1wkvAPY1w0/iZQYMv5wu1/
	gQpyZaup+sVXPwfQ/tdlrojBYGUNJhau8TIwfizlJHoSOmdfcih2AkYt1qdQZsCRkQDAZW
	l4eJoaj6Ae/2o8kqYqBHhQnu3GNAp98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768925920;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaKpPFY7NiTqAFItrLJolDLqevc+X5d6edHB6/7mXU8=;
	b=9BKoLFiXJTEdPlWa6SCTRstvLRBqZDSmag8zKhq+Jtc7n2hVIpqrNJM3ySLzGKhdLsj7QX
	5TnJNv/22yf79CCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD793EA63;
	Tue, 20 Jan 2026 16:18:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AsD2AuCqb2mZTgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 20 Jan 2026 16:18:40 +0000
Date: Tue, 20 Jan 2026 17:18:38 +0100
From: David Sterba <dsterba@suse.cz>
To: Mark Brown <broonie@kernel.org>
Cc: Boris Burkov <boris@bur.io>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Qu Wenruo <wqu@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs-fixes tree
Message-ID: <20260120161838.GD26902@suse.cz>
Reply-To: dsterba@suse.cz
References: <aW9wHq0fs8KpLCyj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9wHq0fs8KpLCyj@sirena.org.uk>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-9760-lists,linux-next=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,suse.cz:replyto,suse.cz:mid,suse.cz:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dsterba@suse.cz,linux-next@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-next];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_REPLYTO(0.00)[dsterba@suse.cz]
X-Rspamd-Queue-Id: 9B89748A37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:07:58PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the btrfs-fixes tree, today's linux-next build
> (arm64 defconfig) failed like this:
> 
> /tmp/next/build/fs/btrfs/free-space-tree.c: In function 'btrfs_delete_orphan_free_space_entries':
> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:9: error: implicit declaration of function 'BTRFS_PATH_AUTO_RELEASE'; did you mean 'BTRFS_PATH_AUTO_FREE'? [-Wimplicit-function-declaration]
>  1765 |         BTRFS_PATH_AUTO_RELEASE(path);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~
>       |         BTRFS_PATH_AUTO_FREE
> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: error: 'path' undeclared (first use in this function)
>  1765 |         BTRFS_PATH_AUTO_RELEASE(path);
>       |                                 ^~~~
> /tmp/next/build/fs/btrfs/free-space-tree.c:1765:33: note: each undeclared identifier is reported only once for each function it appears in
> /tmp/next/build/fs/btrfs/free-space-tree.c:1817:1: error: control reaches end of non-void function [-Werror=return-type]
>  1817 | }
>       | ^
> cc1: some warnings being treated as errors
> 
> Caused by commit
> 
>    7fcf8455f610b (btrfs: reject new transactions if the fs is fully read-only)
> 
> I have used the version from 20260119 instead.

Sorry, I'll drop the patch from next-fixes.

