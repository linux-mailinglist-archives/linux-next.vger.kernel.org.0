Return-Path: <linux-next+bounces-4890-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF69E7244
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 16:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C75C16C959
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 15:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF06313E03A;
	Fri,  6 Dec 2024 15:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Aui/ffE2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nC2lNAB2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Aui/ffE2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nC2lNAB2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDCE53A7
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733497615; cv=none; b=cS3iFRqFDlEuG0SZUJYcnXCv7zqMdYx/kChhuHNpO+/m/k4pt3P1mdXwcGmaVXccRTxMkg9LzJ9RE7Opmwl6XJkeiB5XJ5/4EUS3rZO2azIxRoi2YHS4bC6uBcJFIUCPbEaC2bll4KdHeXqdaI+IVzQDeN+VO6MQDiP0/sNNROE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733497615; c=relaxed/simple;
	bh=N9HszeRTyRZ/jF41ju1pd2wA7NM/pcdN2DthCS30mes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mm2vh9Wa7lqEbIE3wAG/H/Iq4ayae8Jq+ZJkyGY18bfWxE5EnkPBjDWKZNUevITEqPFChfymCt9Yd01BDo2IZ3XrAUJiDsd8mSdv2DBOClfIY5vmMkLlo146CFpuJsP1M+JIx54s6Epnyqyt/lcVrDkA58YE3KOBtTwH3M9CIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Aui/ffE2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nC2lNAB2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Aui/ffE2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nC2lNAB2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1E0511F381;
	Fri,  6 Dec 2024 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733497612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGRblxVzSvo6kOQL7C8pEEtboqQoeFfE6g7useVe5Bo=;
	b=Aui/ffE2gx1ET4Bb9C4IEyb3g4iPKYVrZbsLgJGxIQFYE0ILHvmPE3hltHaA0YHIhzldbD
	VHgg3RMxCcwiQS6gWMXVJb2mzM09zm567Gjl3GdodqBbC0hS5j3m+ErhsJ+zGv/RmtQHHd
	EoiJV5MqT3W+Nv1Bv7Xq/1FqN4+gmAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733497612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGRblxVzSvo6kOQL7C8pEEtboqQoeFfE6g7useVe5Bo=;
	b=nC2lNAB2ESL2hlY1PoJVOzRVM8asnuBbve2Vvd8N6BZQqUK+PGB+g2K/H/zvXenqLLomN1
	opzK6qmjIaGBqLDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733497612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGRblxVzSvo6kOQL7C8pEEtboqQoeFfE6g7useVe5Bo=;
	b=Aui/ffE2gx1ET4Bb9C4IEyb3g4iPKYVrZbsLgJGxIQFYE0ILHvmPE3hltHaA0YHIhzldbD
	VHgg3RMxCcwiQS6gWMXVJb2mzM09zm567Gjl3GdodqBbC0hS5j3m+ErhsJ+zGv/RmtQHHd
	EoiJV5MqT3W+Nv1Bv7Xq/1FqN4+gmAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733497612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGRblxVzSvo6kOQL7C8pEEtboqQoeFfE6g7useVe5Bo=;
	b=nC2lNAB2ESL2hlY1PoJVOzRVM8asnuBbve2Vvd8N6BZQqUK+PGB+g2K/H/zvXenqLLomN1
	opzK6qmjIaGBqLDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 119D613647;
	Fri,  6 Dec 2024 15:06:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kspBBAwTU2frdAAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 06 Dec 2024 15:06:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id BE556A08CD; Fri,  6 Dec 2024 16:06:51 +0100 (CET)
Date: Fri, 6 Dec 2024 16:06:51 +0100
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>,
	linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: Missing signoffs in the ext3 tree
Message-ID: <20241206150651.faqvawcpxdwtx23r@quack3>
References: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk>
 <20241206144606.eltwdm6srrhlplss@quack3>
 <CAOQ4uxij2yMrhT+Vs-raa+p9jO_P68gYztoRLuGAg2eCMha6Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxij2yMrhT+Vs-raa+p9jO_P68gYztoRLuGAg2eCMha6Pg@mail.gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -3.80
X-Spam-Flag: NO

On Fri 06-12-24 15:52:49, Amir Goldstein wrote:
> On Fri, Dec 6, 2024 at 3:46 PM Jan Kara <jack@suse.cz> wrote:
> >
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
> >
> > Amir, I'm not sure about the authorship of "fanotify: don't skip extra
> > event info if no info_mode is set". Was it you or actually Josef?
> 
> I do not know if I sent out a sketch, but looks like Josef was the
> author of the patch in its current form:
> https://lore.kernel.org/linux-fsdevel/adfd31f369528c9958922d901fbe8eba48dfe496.1721403041.git.josef@toxicpanda.com/
> we passed the branch back and forth so many times that I might have
> changed authorship by mistake,
> so best fix authorship.

Thanks, done!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

