Return-Path: <linux-next+bounces-5788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A926A5F9D4
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 16:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21AB219C307E
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 15:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2173A268684;
	Thu, 13 Mar 2025 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="z0YuMFnX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KjImxb+x";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="z0YuMFnX";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="KjImxb+x"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5B267F4F
	for <linux-next@vger.kernel.org>; Thu, 13 Mar 2025 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879736; cv=none; b=rQOyLCi+vpb0Iz58em7+2vo+/UpKvKn20AxEEB4XF7Jte+IqPxAaA1zqLSWc7buVbaP6/IyI8YT1fGlIAay8D0cV8BV2C9ZzLZySbkjzyvchaAkuOgxMS8eVwzK2X6mgx1RQi/5OSNkK4ap2AplpPj9GlxKd/0jac2wyLPOfPfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879736; c=relaxed/simple;
	bh=36k0TlL5aEc2I8sZ0kU+FjEBUdKQFkuUdXwaj2GmVT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/CJFhSACDRpfPeRaKHaC3XH08NRw0kEmlx20dnoqfNnxq/MemSiJgQjW2/wDd7yPCuGWoLpG4X4YBmPqMYHTMZuUBblpBbjvaDzk6e3T3lbwu8/USrSnZxKNiCEnViRNOA9TAmoU90A9241clvGstHh4Bta35o2+L/XUSgAhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=z0YuMFnX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KjImxb+x; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=z0YuMFnX; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=KjImxb+x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B18FF1F388;
	Thu, 13 Mar 2025 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1741879732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Da3VwQ0Q/TpvbUSlTbof5uzpY0q8GBI7PkAEVqPXZmA=;
	b=z0YuMFnX4Gl9Vol4QPmUR9Vs2SUZZMhAKm5PJxIqg466iddNC7rFXEFBj6UDYUDmXLoGm+
	oYWrRo0Hh30IunT4SH1+hLK2TF09Gu3CViBtzaKws4CgEvUR2cve7Yh8IZtVJGXRc93o0L
	dYiq+L3i3c1DPZUitNYSSlrO6p5l8e4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1741879732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Da3VwQ0Q/TpvbUSlTbof5uzpY0q8GBI7PkAEVqPXZmA=;
	b=KjImxb+x9GkRIoNLRBiM/Ok1yYUEgPo/AH1cUEi8OMxkMNDlWYRGuhezrgGQ1dqnE5w9vz
	E9yxzmps+nBOK9BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1741879732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Da3VwQ0Q/TpvbUSlTbof5uzpY0q8GBI7PkAEVqPXZmA=;
	b=z0YuMFnX4Gl9Vol4QPmUR9Vs2SUZZMhAKm5PJxIqg466iddNC7rFXEFBj6UDYUDmXLoGm+
	oYWrRo0Hh30IunT4SH1+hLK2TF09Gu3CViBtzaKws4CgEvUR2cve7Yh8IZtVJGXRc93o0L
	dYiq+L3i3c1DPZUitNYSSlrO6p5l8e4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1741879732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Da3VwQ0Q/TpvbUSlTbof5uzpY0q8GBI7PkAEVqPXZmA=;
	b=KjImxb+x9GkRIoNLRBiM/Ok1yYUEgPo/AH1cUEi8OMxkMNDlWYRGuhezrgGQ1dqnE5w9vz
	E9yxzmps+nBOK9BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DDE9137BA;
	Thu, 13 Mar 2025 15:28:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 66KFJrT50mdXHQAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 13 Mar 2025 15:28:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 5E1CFA0908; Thu, 13 Mar 2025 16:28:48 +0100 (CET)
Date: Thu, 13 Mar 2025 16:28:48 +0100
From: Jan Kara <jack@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ext3 tree
Message-ID: <bvj5iudnoftzgevrgt2yomwnt3jfgecjcg3cx7jh7pehnyvgej@3wjfqkiiljob>
References: <20250313115026.364a8147@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313115026.364a8147@canb.auug.org.au>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,gmail.com,vger.kernel.org];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.80
X-Spam-Flag: NO

On Thu 13-03-25 11:50:26, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   c27bb2f1343c ("Revert "fanotify: disable readahead if we have pre-content watches"")
>   4fea134e1712 ("Revert "mm: don't allow huge faults for files with pre content watches"")
>   e28a4bdddc53 ("Revert "xfs: add pre-content fsnotify hook for DAX faults"")
>   df4447e2b3ef ("Revert "ext4: add pre-content fsnotify hook for DAX faults"")
> 
> are missing a Signed-off-by from their author.
> 
> Reverts are commits as well, so need reasonable commit messages and SoBs.

Yeah, I wasn't sure about reverts so thanks for letting me know. I'll fix
that up.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

