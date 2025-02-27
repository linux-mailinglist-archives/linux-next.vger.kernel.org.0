Return-Path: <linux-next+bounces-5589-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75BA47974
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 10:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92AE5171A42
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 09:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C37226534;
	Thu, 27 Feb 2025 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ll7E5nOn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pWE3CECj";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ll7E5nOn";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pWE3CECj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A70226177
	for <linux-next@vger.kernel.org>; Thu, 27 Feb 2025 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649253; cv=none; b=Zd6dkztbKaYgQ66TXh7mKmleYrwQk6o547vPYHAGqBZQTihBjGRAPgCLrFaU3JbuRxs8t7iJRhLhfBSfhEKowrxuhIP2HnkSZB/Nb/k9j30dUSynU7n2xNlToDPhe83za3DKmBi/O2pKeryVPR2ROprOw1SY29Aa7B65A1KJRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649253; c=relaxed/simple;
	bh=zHU1v0Cc0UaisjgExOZcPWyMuGYjHPbxdW6xL2SCog0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaMYsa9UX9IGjSUKukrhNo2WP1AdukLQ3dBJQZQUNriNCM2VplcdV2PyO9izFhbmp10uCIkwSQvSKq/lIWcRJthn2bfAMDa57PbyYPIL1xKSCKoJCJikpaVqgLim9NPN4zYdf+mq/WD1J+6nTFV2RqkTP2RSWpAsL8GpAMqysDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ll7E5nOn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pWE3CECj; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ll7E5nOn; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pWE3CECj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE38B1F38F;
	Thu, 27 Feb 2025 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1740649243;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EbKxWAYwt++J388gIevwx92wSnps6TdEX/dkt8kQHDA=;
	b=ll7E5nOnqhXe86ArfvniAOUVWoIyZbINXGS2K5pa8jyxVPjfuLlbmtH7DLttB7NYlok86M
	uQ8zc4gK5S42igjqaOWFqu26wy+NP/ruOQ/r7BA6ziNHjzpdQ9T/ECNUpwEPXMunoRUgSG
	ZAoeYn6wwi/PF0oPqMrRbezTWifllJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1740649243;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EbKxWAYwt++J388gIevwx92wSnps6TdEX/dkt8kQHDA=;
	b=pWE3CECjrXgxSRLzWxxbfE8wN6dvzj8oYKY5XbLUBxPdKqLBZDA0BizmJznxX+Txbl9QK9
	V4J0LiC5h+TlrlDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1740649243;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EbKxWAYwt++J388gIevwx92wSnps6TdEX/dkt8kQHDA=;
	b=ll7E5nOnqhXe86ArfvniAOUVWoIyZbINXGS2K5pa8jyxVPjfuLlbmtH7DLttB7NYlok86M
	uQ8zc4gK5S42igjqaOWFqu26wy+NP/ruOQ/r7BA6ziNHjzpdQ9T/ECNUpwEPXMunoRUgSG
	ZAoeYn6wwi/PF0oPqMrRbezTWifllJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1740649243;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EbKxWAYwt++J388gIevwx92wSnps6TdEX/dkt8kQHDA=;
	b=pWE3CECjrXgxSRLzWxxbfE8wN6dvzj8oYKY5XbLUBxPdKqLBZDA0BizmJznxX+Txbl9QK9
	V4J0LiC5h+TlrlDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C18AC13946;
	Thu, 27 Feb 2025 09:40:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2QUOLxszwGfDFwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 27 Feb 2025 09:40:43 +0000
Date: Thu, 27 Feb 2025 10:40:42 +0100
From: David Sterba <dsterba@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Sterba <dsterba@suse.com>, Goldwyn Rodrigues <rgoldwyn@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20250227094042.GZ5777@suse.cz>
Reply-To: dsterba@suse.cz
References: <20250227103214.2cf95e8a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227103214.2cf95e8a@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Feb 27, 2025 at 10:32:14AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the btrfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/extent_io.c: In function 'btrfs_set_folio_subpage':
> fs/btrfs/extent_io.c:874:45: error: passing argument 2 of 'btrfs_is_subpage' from incompatible pointer type [-Wincompatible-pointer-types]
>   874 |         if (!btrfs_is_subpage(fs_info, folio->mapping))
>       |                                        ~~~~~^~~~~~~~~
>       |                                             |
>       |                                             struct address_space *
> In file included from fs/btrfs/extent_io.c:26:
> fs/btrfs/subpage.h:95:51: note: expected 'struct folio *' but argument is of type 'struct address_space *'
>    95 |                                     struct folio *folio)
>       |                                     ~~~~~~~~~~~~~~^~~~~
> 
> Caused by commit
> 
>   40524fd05deb ("btrfs: kill EXTENT_FOLIO_PRIVATE")
> 
> I have used the btffs tree from next-20250226 for today.

Fixed in in today's for-next snapshot.

