Return-Path: <linux-next+bounces-5013-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA69F8E6D
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 09:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F231605A3
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CD51A83FC;
	Fri, 20 Dec 2024 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UD2ZW53m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Se7x2ekg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UD2ZW53m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Se7x2ekg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90311A0BFA;
	Fri, 20 Dec 2024 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685100; cv=none; b=hQHoDHoa16DMskmlvUf6OUySJNOCF2PaUG8z0fGlxbJ9gAtnMEeXGvnl7X6Tui8QzBLAMp12hlUaxr/ujQF8wCDOILXbno4seE93dG/4OEgB9g8PNmM1t2Z3bp/Eb/JN0R8haQq3hNJY3DZshR3AH0DOAARtHsf3YJN4KdOzYtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685100; c=relaxed/simple;
	bh=WjQ9gnT+9tZD93JaX81Epo9KryDe3rVHGO8LQF+dhVM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPu297OCTSN4s3b5YNgmR1nUMoQkzCxEemjHAFLlkJGTPgLbxtHIGjLHuo/rwAhCHZcJ7HN9tOjaevPH42AmJF1xNGuLj3AefecxjQAi404tqtnjsycWL3JsZvz0d9cRFG/gCdrtg/a0zC+9v6wjP2GuaINHhZyzzlg7eyJxoME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UD2ZW53m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Se7x2ekg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UD2ZW53m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Se7x2ekg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 344E21F830;
	Fri, 20 Dec 2024 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734685097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbrPSGzswK68pzoNC3pJO2+4dp4iqNom53prKH7bD/M=;
	b=UD2ZW53myfL/1uiwcINMC3l3qzd9K4a2SxbuyewtzuzxTFjqtS2y4cO2DRiFUH9GxzX9ue
	gF8b/zWXAYCVhtJpteBy+F0AsN1RJsP2WCPGK2qDFipRt7OLQz8D54jJsORmSOpu1G87o5
	6zy6TwUxcsomsyJ0o4pOuK4Zwejr/w0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734685097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbrPSGzswK68pzoNC3pJO2+4dp4iqNom53prKH7bD/M=;
	b=Se7x2ekg2LmIjq0incr+wqJps+AxzYjmPKMHOqwc77/M93rMAHoIrQFQWc7LRUxHbLioN4
	/9vRLGIUmsVkwVBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734685097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbrPSGzswK68pzoNC3pJO2+4dp4iqNom53prKH7bD/M=;
	b=UD2ZW53myfL/1uiwcINMC3l3qzd9K4a2SxbuyewtzuzxTFjqtS2y4cO2DRiFUH9GxzX9ue
	gF8b/zWXAYCVhtJpteBy+F0AsN1RJsP2WCPGK2qDFipRt7OLQz8D54jJsORmSOpu1G87o5
	6zy6TwUxcsomsyJ0o4pOuK4Zwejr/w0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734685097;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbrPSGzswK68pzoNC3pJO2+4dp4iqNom53prKH7bD/M=;
	b=Se7x2ekg2LmIjq0incr+wqJps+AxzYjmPKMHOqwc77/M93rMAHoIrQFQWc7LRUxHbLioN4
	/9vRLGIUmsVkwVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C3E413A63;
	Fri, 20 Dec 2024 08:58:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id stWRHqgxZWcobQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Dec 2024 08:58:16 +0000
Date: Fri, 20 Dec 2024 09:58:15 +0100
Message-ID: <874j2yras8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Liam Girdwood
 <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai
 <tiwai@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
In-Reply-To: <20241219222355.0c8f2235@canb.auug.org.au>
References: <20241216130934.0d1ef471@canb.auug.org.au>
	<20241219173334.25970764@canb.auug.org.au>
	<AM0PR04MB7044110ACEF4D67F3C37AD4CE3062@AM0PR04MB7044.eurprd04.prod.outlook.com>
	<dcabf2f3-f764-41ae-9dfe-2a6261e542f3@sirena.org.uk>
	<20241219222355.0c8f2235@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,gmail.com,perex.cz,suse.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 19 Dec 2024 12:23:55 +0100,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> On Thu, 19 Dec 2024 11:13:38 +0000 Mark Brown <broonie@kernel.org> wrote:
> >
> > On Thu, Dec 19, 2024 at 06:42:57AM +0000, S.J. Wang wrote:
> > 
> > > The fix has been sent.  Not sure if maintainer is taking vacation and if need some time to
> > > be applied.  
> > 
> > Yes, Takashi is on holiday.
> 
> OK, thanks.  Good to know that it is in hand.

Now all fixes applied to sound git tree.
Let me know if anything is missing.


thanks,

Takashi

