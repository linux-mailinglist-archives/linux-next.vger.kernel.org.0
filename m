Return-Path: <linux-next+bounces-4918-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664039E9097
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 11:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56699163C11
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE4421E09F;
	Mon,  9 Dec 2024 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SCCqZqhJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+9zYtOHV";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="SCCqZqhJ";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="+9zYtOHV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281B21CFFB
	for <linux-next@vger.kernel.org>; Mon,  9 Dec 2024 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740620; cv=none; b=AVeoBYP4VC3BHDz4xxxHtMc0QrN6r+d2aAoi1yG0jydGsjuTc+GKby2BN3RqighXYdh/rVedxtyYIGkgNvgs0fHPT3d5dwc4rqLcrzJ1f5BrB8VEiWJ88kyyhE/lBEITCbpKxa/QXM+/mHyJ0cj5DTCDvAjc2NQJYDciJWcX73w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740620; c=relaxed/simple;
	bh=SLoUFuMYyg13FmjhhkcqoZb9LyuE1NZNu1wLDzuJNIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp+gnACSL+sPHJR8ofVzB1dSvDfr9fGH5aL9Krtk3+BGA5oCOJ9SscJsAg+njV0+4ntfN2obSxJIaWiK4uko8Evcvr3lJfWo+ADT/yyFA9oYZ1Pew3ZwQC8y1ncUWq6b6of2YHLirXakxXVePGKQM8CWjE3XySQtCHDf6jo/GIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SCCqZqhJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+9zYtOHV; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=SCCqZqhJ; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=+9zYtOHV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ACB651F45B;
	Mon,  9 Dec 2024 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733740616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SIlhaywNfaezYQ3qCBatHPIi78Y9gB9lO+HJ64nIsk=;
	b=SCCqZqhJdyXYCt5mfpfm4xQRakrE1NA7pcibX2HVt44gpq0tvoJSxK0uAZLtjuZZMfY3FM
	EegS5FJgNSB6nAkdOoA+cpzaADBA3WVe6O4ni4sO4jKErDc+y0TGzk0Ai/evczHrgv4zVX
	5ZC4XxOwDN9+t39eNJ1JNRDefiS5eS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733740616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SIlhaywNfaezYQ3qCBatHPIi78Y9gB9lO+HJ64nIsk=;
	b=+9zYtOHV76V0kzJ86X/MFQI38/R1YakydA87n6Wy1Ved8Ln0nulmgHJ1PJyo7nNB4BwCKS
	UO9aY/0NXcOQ92Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=SCCqZqhJ;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+9zYtOHV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733740616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SIlhaywNfaezYQ3qCBatHPIi78Y9gB9lO+HJ64nIsk=;
	b=SCCqZqhJdyXYCt5mfpfm4xQRakrE1NA7pcibX2HVt44gpq0tvoJSxK0uAZLtjuZZMfY3FM
	EegS5FJgNSB6nAkdOoA+cpzaADBA3WVe6O4ni4sO4jKErDc+y0TGzk0Ai/evczHrgv4zVX
	5ZC4XxOwDN9+t39eNJ1JNRDefiS5eS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733740616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SIlhaywNfaezYQ3qCBatHPIi78Y9gB9lO+HJ64nIsk=;
	b=+9zYtOHV76V0kzJ86X/MFQI38/R1YakydA87n6Wy1Ved8Ln0nulmgHJ1PJyo7nNB4BwCKS
	UO9aY/0NXcOQ92Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E36213983;
	Mon,  9 Dec 2024 10:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I7aUJkjIVmf7NgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 09 Dec 2024 10:36:56 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 4F1F9A0B0C; Mon,  9 Dec 2024 11:36:52 +0100 (CET)
Date: Mon, 9 Dec 2024 11:36:52 +0100
From: Jan Kara <jack@suse.cz>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
	linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: Missing signoffs in the ext3 tree
Message-ID: <20241209103652.b2ou6zjq6yexb7ra@quack3>
References: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk>
 <20241206144606.eltwdm6srrhlplss@quack3>
 <20241206172828.GT3387508@ZenIV>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206172828.GT3387508@ZenIV>
X-Rspamd-Queue-Id: ACB651F45B
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_CC(0.00)[suse.cz,gmail.com,vger.kernel.org,kernel.org];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.cz:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

On Fri 06-12-24 17:28:28, Al Viro wrote:
> On Fri, Dec 06, 2024 at 03:46:06PM +0100, Jan Kara wrote:
> > Hi!
> > 
> > On Fri 06-12-24 10:22:31, Mark Brown wrote:
> > > Commits
> > > 
> > >   74094f677916e ("fanotify: don't skip extra event info if no info_mode is set")
> > >   8adc64d022177 ("fs: get rid of __FMODE_NONOTIFY kludge")
> > 
> > Thanks for noticing Mark.
> > 
> > Al, care to provide your signed-off-by for the
> > "fs: get rid of __FMODE_NONOTIFY kludge"? Amir then massaged the details
> > but you were indeed the original author of big part of the patch. Thanks!
> 
> Patch appears to match what I have in a local branch + fix for braino caught
> by Amir, so...
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Thanks! Branch updated & pushed out (and my for_next branch as well).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

