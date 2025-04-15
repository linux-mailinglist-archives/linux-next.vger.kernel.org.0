Return-Path: <linux-next+bounces-6258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C4A8A6FC
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 20:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3028E1900FDA
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 18:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFCA227E88;
	Tue, 15 Apr 2025 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vHgLioMC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IV34bFhe";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0gD7vsfg";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="tCpHfmHS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F152221549
	for <linux-next@vger.kernel.org>; Tue, 15 Apr 2025 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742590; cv=none; b=LU65vFz6P669HbBcBjtX/L6vyRis0Co2kVuBghD4+9FOmehwjb0Z+BDzTuR9MfgULJ/S46Bovr2Uez4npZgWdSCJ3Xow+yqDk+bLY/LpdXKVQmd5m8cZ64c+M6wr2/hP//3DUJH6Ddgm//0nUvcDxRRJCa5HHjlIkwyUH5m46Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742590; c=relaxed/simple;
	bh=Ti8T/+AJeMqKSLnnRUkTPrI9cdo5pcXbsA3IWJ3XwHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWV8iojgArANpo6uD/rlPYgdWY/kbO20xR2Gc/j/gM8qHjyhu3u9eolKFCSfo8LNZxKp35HArWC2IdE+ro/v3h4L/1c1p+tojVqhT0gm2ny3THizABhr6Qr8qlvPiyXaaUX57o4MfgBowdWzISu6NFByGA5vqtXdS3/TpqZpOBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vHgLioMC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IV34bFhe; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0gD7vsfg; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=tCpHfmHS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 774DE21237;
	Tue, 15 Apr 2025 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744742586;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Q/aXfI8Ij68zDwG8YJTrJ89uWxDlN/jTk8ewWY3AZ0=;
	b=vHgLioMCJc7SIRRIhLJw6W1ZOyXLjjIkCOHGiwjf9K0K9i6Dwe3Ar1lTjFBDYDRzi1U3c3
	3blhbopS2Rm6AJyJiobK9KE+A6QhF5G/cemDHz092/oI2n+UuEWKjf6Xs4fGsRRRj+Vg0h
	3apS6k7fo90KvhtpGlGL6FS0aelv4wU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744742586;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Q/aXfI8Ij68zDwG8YJTrJ89uWxDlN/jTk8ewWY3AZ0=;
	b=IV34bFheGGeCn6JcWbwNkmtFlGDPAi6Hq6g8/LwiL+kVrv5od1O2t0GBXYKDcv4Y1Dg1gK
	IfYxqMslpeYe1gDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=0gD7vsfg;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=tCpHfmHS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744742585;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Q/aXfI8Ij68zDwG8YJTrJ89uWxDlN/jTk8ewWY3AZ0=;
	b=0gD7vsfgrzz7MXtwarnBt5LU9JmTWfbVxHLcOtJzDv7JMQXuMFzHocrxzCUEA8zaidr7bK
	BkODc9vFUXjoNANpYZtKwtqUW4kutaRKXrOXf2RbSXCwFNJre7rThIaUZ5vWVga8XqDvLe
	6AGOGUsMFetEFqPILvCzXlDTw0h9Z+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744742585;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Q/aXfI8Ij68zDwG8YJTrJ89uWxDlN/jTk8ewWY3AZ0=;
	b=tCpHfmHSyruoQ3HmNlKvNi0O7z9fChwNFcBiTXHguaPyG9yN42TNZNEOA1jK3pZWM69hod
	P5wH1YbHnOP5ZwDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64D06139A1;
	Tue, 15 Apr 2025 18:43:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y4NVGLmo/mf6CAAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 15 Apr 2025 18:43:05 +0000
Date: Tue, 15 Apr 2025 20:43:00 +0200
From: David Sterba <dsterba@suse.cz>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the btrfs tree
Message-ID: <20250415184300.GO16750@suse.cz>
Reply-To: dsterba@suse.cz
References: <20250415080837.477fd5a9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415080837.477fd5a9@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Queue-Id: 774DE21237
X-Spam-Level: 
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:replyto,suse.cz:dkim,suse.cz:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.21
X-Spam-Flag: NO

On Tue, Apr 15, 2025 at 08:08:37AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   fb1f2fdbcf36 ("btrfs: fix invalid inode pointer after failure to create reloc inode")
> 
> Fixes tag
> 
>   Fixes: 00aad5080c51 ("btrfs: make btrfs_iget() return a btrfs inode instead")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: b204e5c7d4dc ("btrfs: make btrfs_iget() return a btrfs inode instead")

Yes this is correct commit id, thanks. Updated and pushed.

