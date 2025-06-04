Return-Path: <linux-next+bounces-7057-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEAACDC3C
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 13:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7E401895C15
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252EA28E61C;
	Wed,  4 Jun 2025 11:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZ2MRuyK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8564E28E610;
	Wed,  4 Jun 2025 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034812; cv=none; b=g7pfxw4lwi0QhWW1mv66Yq96HEvBw4Frr9xUF0FNjDYb65S3MeKqGV3VOHlH0Lt6pT1yyPDzQW0lMI5ILpvzms8Ud885qi5t9Z0EY5BRHQY/NrIoB2qXBB4Ms9b1KIbSSe9p0ETw9FXJME3kjQfYGbVqH7hD4+0EIJEGF+es55Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034812; c=relaxed/simple;
	bh=Schw2RsYLQNpi+xEERdg/mqlrK2JYXvaTEsebGb49Qo=;
	h=From:Content-Type:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=anSyolsIVfXow+E49868S2ZT/chg0/Wb5UFjh2F55blx37dePxBKL5m/VAEwgD9BVmEIhOOx6V1+ZjmdLneCLOQeVUjQn9C0lDdpKLzyqS55qYjJD7u2PcEajH5mSXaxyNX4UGhCc1srGGRXzJTwGnMPNu93zfaA5+vV2ZtNHhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZ2MRuyK; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso41105676d6.2;
        Wed, 04 Jun 2025 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749034809; x=1749639609; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Schw2RsYLQNpi+xEERdg/mqlrK2JYXvaTEsebGb49Qo=;
        b=BZ2MRuyKYoHD8j+DnuImZItXZQ3K8DKvbsQt62JPHfNF02NjNOAX6BzTTtydTgdT5G
         nS4tC94c58sPEaEW+OJoFZoYs0+s+C8tNLYqpl9AYG8s5aIBN7bnftYjJ8Fqp0BoOIx4
         slFXTw8ChywA/pz0jrbWNGvHwg1rct8tpDJso1DHkble7l8mJ314UTrrWdozLonk/kaa
         2+0P4xubQmEHpE3/piEhfaI4nQblCLuKGIo99nqVyMG3pBACELG0HAxGlqG/HuygqrI5
         qXyLBXu5HPs7i/cxyxjhlY4vHGvyT9sMtrza5uqM+BwkJAWQ1wNUFPc2dmKcr0yswYja
         9ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034809; x=1749639609;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Schw2RsYLQNpi+xEERdg/mqlrK2JYXvaTEsebGb49Qo=;
        b=rIu1At9fVPdw47ykXecSZ9kMxUqiDRGF8q65qsD73qjTlg50WhTGAv/S6yiVQ4gKMQ
         eCeSXdOJ2nTplaNualTyru7lnneuo6BmFa8iYuC5kVY42EfjDzlSSAjLdvCaEsotsW+B
         rxQ0II/FLRizladPsEnQTUoE220zeMD8SWVHV27liKukWi2VJNL/5Iu+446yb8aeOtyp
         gpufPQDDygGONo72nkWSFyqowYs3npPcZ0S/X3TiGsNiMYwIPVfPZGP2N1khNtAQmxPf
         x6KfaKMJMUIH9NDgUiNDF+Zc+DeTD2NLjjiGE0KstxovGechzqQC2pXpYFlAjmR+/jLf
         9U5g==
X-Forwarded-Encrypted: i=1; AJvYcCU5tMW+MZAi0UF/KeERsOUWicdZz9rFMc8lx0tmG8OJrbQVI/p5+f+Yo5z2p39d6BTaFwF8YuEfXkESqqM=@vger.kernel.org, AJvYcCWmwiDXNUw9pNgtKCQa1Q0ibvU5SkKzX6eEEYqkZ60Qk58Ti62G/9kf2jqS0JzVwoOWN7mKtWRJjfmxlBzz6qs=@vger.kernel.org, AJvYcCWubQjVnxcBCjJzYS8MF6y0+zlQWEoc3j0q5bReFlazmoEJEY8tNZ1yX77EDmfsbsTcrxd3mA4rHQjYyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGa6v5z2CBTquYErqSoKtzpqp2mk0MYIu1yotm5YKla3enP+6
	oldmlMTxDvy6WOXDdrrewyk7xs/I88/R5a7dlLfb+JdtQyJlFwEeD1MP
X-Gm-Gg: ASbGncvjRbMaDbJAL9I3clIO4kLqC2a36kjitQDG0WbqFPYOlZEguWxEV6hPhESqVvJ
	bB5Qmzosr7tD0YZIyeQABqP1YEmPFPYDdITxDRx0MmV5Q/y0XIcchkLdJ6bZJkrRdhe4G5aoFe1
	tdAUDhMkrjj5g0ghIudDaFGEx9egovnqw+0cKrYMoLU3kP/8QJVzMYfXQCu43jFfgsdejvWGfjF
	cb+W4p5v47lACb8Y9+O+OVcRORjLWhKnL46D9Mw73iplV4f8Dk6Ncm1RidgT6xkfmCS1f7zmXbh
	iQLcKQT2m4EZWXnFflkvfM+w16zCeuR1IgxKkSv06Ld1bMusXBnWT4KXqM8i3BbwR9yzE1WhnJL
	8Ky94QUuzy5tUqi2vZDXoUkVx2TpVvONTk8xktbbrWw==
X-Google-Smtp-Source: AGHT+IEqSF8mjarZ/kRpcwxU9I19cNQnsgHots4Mmgea27/PfoN1l+IsQDKOfP8c8Ri0J7J4W7BS0g==
X-Received: by 2002:ad4:5ce2:0:b0:6fa:bb44:fddf with SMTP id 6a1803df08f44-6faf6e87e98mr35729696d6.16.1749034808945;
        Wed, 04 Jun 2025 04:00:08 -0700 (PDT)
Received: from smtpclient.apple (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fafb6899dasm3364456d6.21.2025.06.04.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:00:08 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
X-Google-Original-From: Rudraksha Gupta <GuptaRud@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: REGRESSION: armv7 build mismatched types
Date: Wed, 4 Jun 2025 03:59:56 -0700
Message-Id: <C830877D-1EC4-4F94-947B-8B5CD7E09546@gmail.com>
References: <CANiq72kghKg7FU=W_yO_q9VuCf=smiyzvrcU8oOFG2FFFsOQiA@mail.gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
In-Reply-To: <CANiq72kghKg7FU=W_yO_q9VuCf=smiyzvrcU8oOFG2FFFsOQiA@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: iPhone Mail (20H360)

Perfect! Works for me now, thanks :)

Thanks,
Rudraksha

