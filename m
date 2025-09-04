Return-Path: <linux-next+bounces-8194-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65548B43622
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 10:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45681899D22
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C692C2C21D4;
	Thu,  4 Sep 2025 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="0kz63BkB"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B222C2343;
	Thu,  4 Sep 2025 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975282; cv=none; b=KDziPThKmrqXfDWpNgI4wRLui6rNQMXlwBnwpBYdjLVxN/EZdSn5inqwg0PQC9JgW0+Ed/wYLYfnkFXBdHjNMNDABIlawze6lL6IfQGb8DVMxnYRbx4T1sWhWfI0hSS1GNA8eu08mRHeIeHnHU5P1nUTtfgot7HLy4OpoAcGTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975282; c=relaxed/simple;
	bh=rkW+hd9eSoGmYDWWZXKqRemGUOuDtbEu5o+RnvQE6Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ko6L3Wdgsh8lAbvkI8iD/BSdptRvQuj8gU9HwE95ONgOwPBzG5IBukjcrFWGDBwcsDg/RI38mogMoKxs+kdQNWTUbxkSIS4cXduEb1GO5QBaKrsaUDgNuAyEZfVZ9O3jRESveGecKx8fzKZL8mFkZiqVEVvE8iAbBXUXV2InnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=0kz63BkB; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHXxy4bSbz9skk;
	Thu,  4 Sep 2025 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1756975270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdWpIc05upd/DVNn4jXej5h48jXQjZqSVGU9z22ZNbY=;
	b=0kz63BkB5mKsSA97LfBIFtChgrl1poPgNw5L2DHZ4DaLclLxKqi1KeDVm5FhYjos6gnKXo
	Y97+8H5my3OwserRLT/kwRYZbdfBDwcHQUhCtOwSvfAxH9x8r76qcZ+vvCqEPT749KfIyQ
	xVD1QDKV2xDfjZiu8+l7ESYU9LU5Jnnb+HmQSX80dDlODOrLFuKi6JSbIHv086SFXEG7h1
	nL47PbAsKvTcIGHocIteeRIcUbvPuUlqG/LwFAsS3aNh3WAa/tqzNv1Ler+VdQqrxJ5TSe
	8q74VASiHe2+9GkuRQEOSJzixK5e4H0IwmGnQsfA1rJSpc7CXB2wowQ7pX2/WQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=listout@listout.xyz
Date: Thu, 4 Sep 2025 14:10:58 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-next@vger.kernel.org, 
	cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, broonie@kernel.org
Subject: Re: [RFC PATCH] ASoC: Intel: avs: Fix reading 1 or more bytes from a
 region of size 0
Message-ID: <dfgah3p2jump6zzqmbb6gw36ierfpth2l4fkfucskoppkwmojd@bqgh4nwh72cm>
References: <20250902080812.684149-1-listout@listout.xyz>
 <87qzwp9so4.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87qzwp9so4.wl-tiwai@suse.de>
X-Rspamd-Queue-Id: 4cHXxy4bSbz9skk

On 02.09.2025 10:15, Takashi Iwai wrote:
> On Tue, 02 Sep 2025 10:08:12 +0200,
> Brahmajit Das wrote:
> > 
> > Building the next tree with GCC 16, results in the following error:
> > 
> > sound/soc/intel/avs/path.c:137:38: error: ‘strcmp’ reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
> >   137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> >       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...snip...
> > Signed-off-by: Brahmajit Das <listout@listout.xyz>
> > ---
> >  sound/soc/intel/avs/path.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
> > index 7aa20fcf1a33..8c3df2002b58 100644
> > --- a/sound/soc/intel/avs/path.c
> > +++ b/sound/soc/intel/avs/path.c
> > @@ -134,7 +134,8 @@ static struct avs_tplg_path *avs_condpath_find_variant(struct avs_dev *adev,
> >  static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
> >  					    struct avs_tplg_path_template_id *id2)
> >  {
> > -	return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
> > +	return id->id == id2->id &&
> > +	       !strncmp(id->tplg_name, id2->tplg_name, strlen(id->tplg_name));
> 
> Please use sizeof()-1 instead of strlen(), as it's a fixed size array.
> 
> Practically seen, it's likely a false-positive from the new compiler.
> But it's still safer to add the boundary check in the code itself.
> 
> 
> thanks,
> 
> Takashi
So, I was testing again and with sizeof, I'm getting

sound/soc/intel/avs/path.c:137:38: error: ‘strncmp’ specified bound 43 exceeds source size 0 [-Werror=stringop-overread]
  137 |         return id->id == id2->id && !strncmp(id->tplg_name, id2->tplg_name,
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  138 |                                              sizeof(id->tplg_name) - 1);
      |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~

So my previous v2 is wrong, please ignore that.
Whereas, with strlen there's no warning :( . I'm quite confused, and
lack the GCC knowledge.

-- 
Regards,
listout

