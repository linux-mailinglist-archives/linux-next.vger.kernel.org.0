Return-Path: <linux-next+bounces-8195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C25B436C4
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 11:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5C677B8569
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 09:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F282D63F6;
	Thu,  4 Sep 2025 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xwLE+5Py";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hdjz0zmY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TDTPU+AI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2DyYuYKF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC92E1731
	for <linux-next@vger.kernel.org>; Thu,  4 Sep 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977266; cv=none; b=Y2XifLnjx+PJ+KNKwB/WBIA9TxuPLaWYfa8HupAEMLlCDWQVQYsIZL6krvFMyGZ0nsLUCad3S//SF61e5bI0Zx6Sdq+Icdy90We0n4XsIeIvuN6oSlmEd1uOzcFHZr7Vc320J1tmebDDweQgJDxoZBpOplvFI6xgW1q49KGj6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977266; c=relaxed/simple;
	bh=p/QsjNjURJIYftCBervgrOG6nlH6yhKNV3KyNZsU33M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjAQXGKS5yi0AwcqlIuNjvI7vuCwI8q/ez33eOQ1I0AoN+a5r8oN9TcuRl2x+bjOPjC7Ve8q9MZjHfN+93pvk0HqNc23n5aV+bVROjBTZQPgbg5eDAsEC/huyU1lnE+YqOy6gaSLqDlGhlPDPwiD/vfVcddNmMp580Ludxe1fOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xwLE+5Py; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hdjz0zmY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TDTPU+AI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2DyYuYKF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C70C5C852;
	Thu,  4 Sep 2025 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756977263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqgujX+WNoe/6ozHrL5dtgprbKdkPCYYH6K6rERYa7M=;
	b=xwLE+5PynFHuB/tDvq8qw5mILRKqVpyYkyXkZJak60Zu8iTx20/g8V05u+sVVryx9Ft9k7
	EeiL4XW0t9s6WAyxlO7o9okdht7MBXFhfCdElDMF3Urv2lrDKG+FccwkaVTviw5ppMT/0X
	tWAy5j87BdyAH6j1p2aq4fAa5DE/E4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756977263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqgujX+WNoe/6ozHrL5dtgprbKdkPCYYH6K6rERYa7M=;
	b=Hdjz0zmYYp5REuRg/kxsxUxqH0PBIR0cFD9SqLfSPXh8v8n7HPFpeVgTpPmjTYLsNEJ8E9
	kbx6qk42DLB67BBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TDTPU+AI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2DyYuYKF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756977262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqgujX+WNoe/6ozHrL5dtgprbKdkPCYYH6K6rERYa7M=;
	b=TDTPU+AIsfVyeFZaWfWOLjKgTveh9aep93AXA9IYOc4q/jBGr71KcC0EX/aRa+FZn2PSoq
	rFV3r5uNoB+L79wIJ8brqDVUGPnV3YbU7NEBFSLMKnjqRLkffLFFV2Sk/4R+1ycMY0PFQR
	5nyetLmBqDocpyj/ZkuI27DLgQWru9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756977262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqgujX+WNoe/6ozHrL5dtgprbKdkPCYYH6K6rERYa7M=;
	b=2DyYuYKFPKZN6Z6uTcfYLAvFO4hLoNLXkEbgbCFIzktwGOazIkGmGpGvSyievK0laz+jb5
	3jxtaa8Cc9HGvrDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF77613AA0;
	Thu,  4 Sep 2025 09:14:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yToJOW1YuWhuFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Sep 2025 09:14:21 +0000
Date: Thu, 04 Sep 2025 11:14:21 +0200
Message-ID: <87jz2etw9e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brahmajit Das <listout@listout.xyz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-next@vger.kernel.org,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org
Subject: Re: [RFC PATCH] ASoC: Intel: avs: Fix reading 1 or more bytes from a region of size 0
In-Reply-To: <dfgah3p2jump6zzqmbb6gw36ierfpth2l4fkfucskoppkwmojd@bqgh4nwh72cm>
References: <20250902080812.684149-1-listout@listout.xyz>
	<87qzwp9so4.wl-tiwai@suse.de>
	<dfgah3p2jump6zzqmbb6gw36ierfpth2l4fkfucskoppkwmojd@bqgh4nwh72cm>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 3C70C5C852
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Thu, 04 Sep 2025 10:40:58 +0200,
Brahmajit Das wrote:
> 
> On 02.09.2025 10:15, Takashi Iwai wrote:
> > On Tue, 02 Sep 2025 10:08:12 +0200,
> > Brahmajit Das wrote:
> > > 
> > > Building the next tree with GCC 16, results in the following error:
> > > 
> > > sound/soc/intel/avs/path.c:137:38: error: ¡strcmp¢ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
> > >   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> > >       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ...snip...
> > > Signed-off-by: Brahmajit Das <listout@listout.xyz>
> > > ---
> > >  sound/soc/intel/avs/path.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> > > index 7aa20fcf1a33..8c3df2002b58 100644
> > > --- a/sound/soc/intel/avs/path.c
> > > +++ b/sound/soc/intel/avs/path.c
> > > @@ -134,7 +134,8 @@ static struct avs_tplg_path *avs_condpath_find_variant(struct avs_dev *adev,
> > >  static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
> > >  					    struct avs_tplg_path_template_id *id2)
> > >  {
> > > -	return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> > > +	return id->id == id2->id &&
> > > +	       !strncmp(id->tplg_name, id2->tplg_name, strlen(id->tplg_name));
> > 
> > Please use sizeof()-1 instead of strlen(), as it's a fixed size array.
> > 
> > Practically seen, it's likely a false-positive from the new compiler.
> > But it's still safer to add the boundary check in the code itself.
> > 
> > 
> > thanks,
> > 
> > Takashi
> So, I was testing again and with sizeof, I'm getting
> 
> sound/soc/intel/avs/path.c:137:38: error: ¡strncmp¢ specified bound 43 exceeds source size 0 [-Werror=stringop-overread]
>   137 |         return id->id == id2->id && !strncmp(id->tplg_name, id2->tplg_name,
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   138 |                                              sizeof(id->tplg_name) - 1);
>       |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> So my previous v2 is wrong, please ignore that.
> Whereas, with strlen there's no warning :( . I'm quite confused, and
> lack the GCC knowledge.

It smells more like a compiler problem.
Care to report to gcc people before scratching too much here?


thanks,

Takashi

