Return-Path: <linux-next+bounces-4887-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D79E70B3
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 15:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E1A3286D00
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 14:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31B245BE3;
	Fri,  6 Dec 2024 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="T4J3gW4s";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VRHMoLLK";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="NxoF6hp2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ASinTOv9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68831494C2
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496379; cv=none; b=IZWjkNHa5IOiKUogfRkydgbdOtwyYjrP2m9BkVIo1EIPdnt2Vg6QnpEjz8QzID2kWmbxyhsVustiQ9/pUi5Pf5rxV6je4i/Tndj1FboZ8Ert2gdowMHLtWyAbZAuqYhOLO3qKZuezUO4Led8n851PP8SY1M14HvKazL59CBq+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496379; c=relaxed/simple;
	bh=ozvfyKiqndNwJ7C7cCZPuwoOX7KQwJDBM9iNKReY67M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSeikx3Ux+09nmNMAMd6XGlrxG0arF5SsAs7LLQq+T+DHGoO4fkFlkVsJQduOZurgx6DSbjFBKy6qTMv3KevOGp5wuxo9trDypIIHl+mc+clQpLYRZtv+YIW9plLfKLqTdoONSwmRa+BY4Atc9xorsHnneWooq45Mf6mS+w3SUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=T4J3gW4s; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VRHMoLLK; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=NxoF6hp2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ASinTOv9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E42FC1F37E;
	Fri,  6 Dec 2024 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733496375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR2tGF1R97AkRGmTazX345Xyp3hMV1M1LGSsj62lbKY=;
	b=T4J3gW4s7UGPSyuOOGxQ38uaML2RtuYumgG67z2GY5NOO4VyMznMHCC6y73xcag3wgneLj
	QTqZHXTn0m46bFYSaUyryrBmrYVzkvQiNi+ka5Zxgd2KYoN58IXZfzHKLLS5vT0qE+4ETy
	AqaY1mAdarkrakULSkhSbI5B9YUUYMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733496375;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR2tGF1R97AkRGmTazX345Xyp3hMV1M1LGSsj62lbKY=;
	b=VRHMoLLK52Lxo1kfXrNv7OLtNHthVaI8l/66JViTMhlaK5NrtQHmdgVfX+XfJsPcRdH0G3
	eli0wfn95wfp9oAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=NxoF6hp2;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ASinTOv9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733496374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR2tGF1R97AkRGmTazX345Xyp3hMV1M1LGSsj62lbKY=;
	b=NxoF6hp2MTvTo4HrOK2CJIr5alnrWnsCvXcscggQKvoeCLwZBBjpOYqs7N3t8xU1xO2Ffe
	vbaAXrwrZCjRnvC5ltLiXxsED4/15wLS7dDhJJzmVbSaKKLSFat5W0NP1qdmcMQ2qIkkkV
	haJ88Dujwfsz6kuD5n32PBkU1V86QlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733496374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR2tGF1R97AkRGmTazX345Xyp3hMV1M1LGSsj62lbKY=;
	b=ASinTOv9HS11sSQaxe2DT0TvhowoREAGXPHCqaahbOJZFeRY0vEWVaFEum+lff8MXKx6uR
	EvW2TrCOejV/1SAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C841D138A7;
	Fri,  6 Dec 2024 14:46:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZALaMDYOU2fhbgAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 06 Dec 2024 14:46:14 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 637C3A08CD; Fri,  6 Dec 2024 15:46:06 +0100 (CET)
Date: Fri, 6 Dec 2024 15:46:06 +0100
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: Missing signoffs in the ext3 tree
Message-ID: <20241206144606.eltwdm6srrhlplss@quack3>
References: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk>
X-Rspamd-Queue-Id: E42FC1F37E
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,ZenIV.linux.org.uk];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

Hi!

On Fri 06-12-24 10:22:31, Mark Brown wrote:
> Commits
> 
>   74094f677916e ("fanotify: don't skip extra event info if no info_mode is set")
>   8adc64d022177 ("fs: get rid of __FMODE_NONOTIFY kludge")

Thanks for noticing Mark.

Al, care to provide your signed-off-by for the
"fs: get rid of __FMODE_NONOTIFY kludge"? Amir then massaged the details
but you were indeed the original author of big part of the patch. Thanks!

Amir, I'm not sure about the authorship of "fanotify: don't skip extra
event info if no info_mode is set". Was it you or actually Josef?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

