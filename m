Return-Path: <linux-next+bounces-8165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82368B3F80B
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 10:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF6416410E
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFBE2E8B77;
	Tue,  2 Sep 2025 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="msg8m1Ie";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oVgzGdSB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="msg8m1Ie";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oVgzGdSB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C12E8B87
	for <linux-next@vger.kernel.org>; Tue,  2 Sep 2025 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800927; cv=none; b=cRy9aD7UI8bz7TN0/4aVjUwUkXlAy+wveQPsQUzT/pqFIE4NlYDRnwjPOK+yeQK8clS3cXSZ83872UdLfE7X3RsVTMioUpYsILWrL7hCFYynS9IgLDxlMwaGAFoHbJVs7pYPHPaI8ZQefOyXhz3xHvzAUkseL+jzApSiao1vDRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800927; c=relaxed/simple;
	bh=a74bbjMRfRdxzl8Jj+CpXJ0ve/m1oNSYeR/QxHTmOj4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+65j2nVGtH3+uMPjqJDLFWVUOMZqKWU8pR4BBp1WWfnEK5VuXiX51NFlIgzKpFCC+eoqC83O2VgaHOslsq4uaZJYcUchG7lwQCNwDx184CjHdNP7LDwGVKwDerWByNoaDIRjuQUTXzcZUC57i8hg9x8jQJOX6baaretYbcePTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=msg8m1Ie; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oVgzGdSB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=msg8m1Ie; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oVgzGdSB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 068F01F445;
	Tue,  2 Sep 2025 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756800924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8l/jxQAuXymQxZevlIr7QicjzYkdX1WqcSCKD96muGI=;
	b=msg8m1IeVeuu9HfGrtDyYydnyavD3maQ/sMz786nbp14z9u4ZxCQQBpGLaKnXP44RJbHzI
	N3yv77OOdbTN7JQyuduutBvV367Wa8J8wxzdHqmH9uwtIOdpJCOSn//SFTihlVTvhDepYl
	N2OM+Lxs0Fvi4r+af74spkq/f53g7/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756800924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8l/jxQAuXymQxZevlIr7QicjzYkdX1WqcSCKD96muGI=;
	b=oVgzGdSBSya//sXnwl9QO+82n/1SwbyIB5lkmwzvhg5Z1ZXUMIoPAvp/LexFg0LGzw+hh3
	MNhv2slhvDdhpbBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756800924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8l/jxQAuXymQxZevlIr7QicjzYkdX1WqcSCKD96muGI=;
	b=msg8m1IeVeuu9HfGrtDyYydnyavD3maQ/sMz786nbp14z9u4ZxCQQBpGLaKnXP44RJbHzI
	N3yv77OOdbTN7JQyuduutBvV367Wa8J8wxzdHqmH9uwtIOdpJCOSn//SFTihlVTvhDepYl
	N2OM+Lxs0Fvi4r+af74spkq/f53g7/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756800924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8l/jxQAuXymQxZevlIr7QicjzYkdX1WqcSCKD96muGI=;
	b=oVgzGdSBSya//sXnwl9QO+82n/1SwbyIB5lkmwzvhg5Z1ZXUMIoPAvp/LexFg0LGzw+hh3
	MNhv2slhvDdhpbBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF61413888;
	Tue,  2 Sep 2025 08:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FqpRLZuntmgacgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Sep 2025 08:15:23 +0000
Date: Tue, 02 Sep 2025 10:15:23 +0200
Message-ID: <87qzwp9so4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brahmajit Das <listout@listout.xyz>
Cc: linux-sound@vger.kernel.org,
	linux-next@vger.kernel.org,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org
Subject: Re: [RFC PATCH] ASoC: Intel: avs: Fix reading 1 or more bytes from a region of size 0
In-Reply-To: <20250902080812.684149-1-listout@listout.xyz>
References: <20250902080812.684149-1-listout@listout.xyz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Tue, 02 Sep 2025 10:08:12 +0200,
Brahmajit Das wrote:
> 
> Building the next tree with GCC 16, results in the following error:
> 
> sound/soc/intel/avs/path.c:137:38: error: ¡strcmp¢ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
>   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from sound/soc/intel/avs/path.h:14,
>                  from sound/soc/intel/avs/path.c:15:
> sound/soc/intel/avs/topology.h: In function ¡avs_condpaths_walk¢:
> sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object ¡id¢ of size 4
>   150 |         u32 id;
>       |             ^~
> sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object ¡id¢ of size 4
> 
> I'm not quite sure if this is a GCC bug or a problem with the source
> code.
> As an workaround, instead of using strcmp, strncmp helps. But would
> really appriciate comments from developers as I'm sure there might be a
> better way to fix this.
> 
> Introduced by commit 595b7f155b926 ("ASoC: Intel: avs: Conditional-path
> support")
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  sound/soc/intel/avs/path.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> index 7aa20fcf1a33..8c3df2002b58 100644
> --- a/sound/soc/intel/avs/path.c
> +++ b/sound/soc/intel/avs/path.c
> @@ -134,7 +134,8 @@ static struct avs_tplg_path *avs_condpath_find_variant(struct avs_dev *adev,
>  static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
>  					    struct avs_tplg_path_template_id *id2)
>  {
> -	return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> +	return id->id == id2->id &&
> +	       !strncmp(id->tplg_name, id2->tplg_name, strlen(id->tplg_name));

Please use sizeof()-1 instead of strlen(), as it's a fixed size array.

Practically seen, it's likely a false-positive from the new compiler.
But it's still safer to add the boundary check in the code itself.


thanks,

Takashi

