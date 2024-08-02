Return-Path: <linux-next+bounces-3217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C19462C3
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 19:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E631E2828B9
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 17:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE79615C126;
	Fri,  2 Aug 2024 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="XrNOS5iI"
X-Original-To: linux-next@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09FF1AE021;
	Fri,  2 Aug 2024 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722621469; cv=pass; b=TLJC0QDH0D4498LNcnl9z98HI9yjnst9VawJ3JfyZAgx0PfhWk5nByn7d0OZ+Helai2YD3OCirfcipK9sikV6tUTEubvOMxf5YJsurybkBlI6uXZyXSvzooAabqoBHQYsdz0D2VkaS0cW8BTdb4Al0oYYtRrGSFZcb2Y0kdbRyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722621469; c=relaxed/simple;
	bh=681KljSbvJwnHppaPJRubgSKRRbnRlXy4FZQH8GM2qs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dGhZa6wHLuIP0M7AYIMjRQas4pmpDxA3m6e8f7wbnfS4of80EuTRvnDskLvtBCzvQimMiUIWIbihuzmA9oPTQ8CQp+5QJGIY6gtcWF8apZF9OU7zwrHo5RNs86rUT8W+nLIv7BEG2L14Cp2djn0lzMAVk0N/mf4UivGK4PDOdlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=XrNOS5iI; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (91-154-92-171.elisa-laajakaista.fi [91.154.92.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WbD7s3VQtz49Pv3;
	Fri,  2 Aug 2024 20:57:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722621465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWd1NH3Yqp6z6FcSD+KgDgLIFvGCTjQTVvXCbKTPUaE=;
	b=XrNOS5iIi7wk/kHbWysofnSPqHd3dxbfb5CiqF7tf+nLPbOoagHkUmTaDbB1fZs9AfgryB
	gIvEdDkFk0xRRgsQBq5mQEEpnRiodDxjpwjyOAUpwnZJQNeiicxnQOodp7t7kQRkKEjp7X
	HFhwLymuf/pWq6EX41TNsuhM2XqHzIouFosKajrwbWEIlqEf2NpyPgMgDB9Ky3WC86fTkY
	OOVeaKO9gttXQen7cyySC0sdN9DvT838sei2nQwyr4xTb8vQlrR4nSEGF6BROq+uRlrTLt
	lzJzBTby9HmQj1ekUdog0Mu8IU8ltXwQHFoTN3ee7SPvhV6yZ1MNQRAcefx0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722621465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWd1NH3Yqp6z6FcSD+KgDgLIFvGCTjQTVvXCbKTPUaE=;
	b=iF6MfBw5SPE6pmpltBYInXDZUqSWfy9mnvXzMAcGwpQZa7imSHc42sgyjZX61wE2NbjbFE
	jMTYgNiLJO7JzpUOU2mLnbSGzP1wfGJqUb5dpTMwufm21y/Uu2rcBy6KBIFcFoOmk8yDcj
	PVu9QRdSt1rMheReq42uijCZjQlaICMbO+eI+BMZlRROa1OifOVGoCv2iD7ptKlu3ik+RU
	kE1ixD/iRmwg5iV0vob3pBSJ6/AcZ79cuRvZ8w7349HBvJ6mnb/4fwELqUBNN1DhhwpNu3
	HxYQYHds7WyEx3Dc2OuZI2sCwR3Isl6D0Qgoc9lplH59ObwO19Ymv3d48e5bfA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722621465; a=rsa-sha256;
	cv=none;
	b=IDJC5wETE8cYYD8GCVylGd4W5p/4KPGzduwvJVc6ZoJ1BE9g6zlgnKM4BzXhPe82D5rBsT
	xfTsIumOFhIiEnShhKap+iVnpepLQPL6UDlr8njhZNPZ8Dda13Sca2Qaqd7U+H4y7wbcTf
	zwRnlU14wJhgpz6NQ8JKoy/nrSjuYcQpcjpOveXIJTvQXCrQUm0koo9fVqv2xeoSpBlVAL
	Dh61MO0o9NDHAMoZcFt4vQ2HmCj1ySS94M1ICxXgxMxS/XY4n+ldUY2OSd6ixkzsW/6MeK
	H4GEjTUPPfWfz+8YoH+NSq6JvdERtIHPbPCKvFWAgUIy2nCFHew+2+MqvKZ9Sg==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Aug 2024 20:57:43 +0300
Message-Id: <D35MCFF29VT4.2JGEENK5HO6WU@iki.fi>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tpmdd tree
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Jarkko Sakkinen"
 <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240802090234.2acf4c25@canb.auug.org.au>
In-Reply-To: <20240802090234.2acf4c25@canb.auug.org.au>

On Fri Aug 2, 2024 at 2:02 AM EEST, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   f6554cbf56be ("KEYS: Remove unused declarations")
>
> is missing a Signed-off-by from its committer.

Will fix, sorry I came from holidays this week and mbsync failed me.
Did a lot of stuff yesterday when I got it finally working (tried
to be careful but shit happens).

[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D2302132

BR, Jarkko

