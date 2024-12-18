Return-Path: <linux-next+bounces-4986-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FC9F5B4C
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 01:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A18F7A3F5E
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2024 00:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5C335958;
	Wed, 18 Dec 2024 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cquPGrdD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AB3595B;
	Wed, 18 Dec 2024 00:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481134; cv=none; b=YZFSghqi4cACYUlCfn9U31UQtBriP/Mc15oCQFv/SS9dFLUAnh378Cf0v5suoyv2Ef+4kM4ooN/eqxll20INI/62XV+rA3NYInBtYQZxw6ThHL73pNU/rWIMRoxD23UXn6dBtONbK6xObLU5Qi0O5mc+L6uutxlDuXuaLkWnGOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481134; c=relaxed/simple;
	bh=q8f+gxzmDvoatC+oWwfRFpq1ZWHzILAwepW4gS21q+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9nWFmyWK7BT7V4IzhPkjTGL1GkmQWAC+kvhgVuK5Onmj3PoeEPKG27cFJjAsOkY2w87R3xoPTLjwARF/1K0/Le4E3gzPul632LRbneg72dk8ce1vbzmYcAqdn/6Nx31e/riQvJs++HJLWozMHcZsLiJSC+RQIHq6nrZAYZkH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cquPGrdD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2efdaa02378so1001443a91.1;
        Tue, 17 Dec 2024 16:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481132; x=1735085932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCkrBxFU1Kq1Ra+mGpMQPNruOE3dUe6oQsjQdmUvy3k=;
        b=cquPGrdDnYJMnVknXh0sq2Gl7HxxGdjnWUBLV8mCqrhX97jl7oCr7ZkcUKaluPVhYF
         ugSqEfdWNzU/f8cx5VLhbI/DSWhgKEyl++CRTwBnRHoIyWbu+fUI7hp4Mrqnrv5TOp2I
         /PnX+q7jfqcHc2/6f08wJckXVQvRgXl+EZBnZ8nL/E7mQ2iyg3IOZOBAETm7ewYxwB33
         CoD+zT1qIGcHrr95c5DMY1rH+41n6WmZbR316W7C/s+a8LdP04QSWjCVTGBfmhKsemLU
         y7wV84IVj7XFz7WoKYZvvUpV8xYBWniq5OtOZk2nqYHKVaqQJ++QON+Fr1nnb0an+seK
         6LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481132; x=1735085932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCkrBxFU1Kq1Ra+mGpMQPNruOE3dUe6oQsjQdmUvy3k=;
        b=HA5FxBWG4xUUavt7Rj65Soa+0VJWNsGde5zktdrUxC/4R36uD+dRB6vnacxa2r9T8r
         haPgVkT5Pq0C0Ce1gRDhc4YpT61jflrt8LUHhq9LjBoDA3efzBrsx2YRQRuqFSuXYzGq
         g7Wv8RmzlasGhDMLUSZFVbFZe36hW7T8qAL6ay9jobdBa0fsBANLqa5RgOWYlyo4C0E0
         elTPPAguH+cFHft9fFx6n39VxdD89HjQKEF8c1rHhERdEheiDndWpkpXyyL2pF56xqVz
         TUVUw/lLXg3FCLcX0pxmmd2NPKF3fJ81WHkNxRFd80haO5IfV8qkjhI5sVi2GQ8dr8yf
         Lhyg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7YXgZ7iu/wdn8F2rbEhUFAG/AdJPXMFAKTompcHuGrziQQ7ias1SN5KiH85xsMYGbJfPo2VxQMS86A==@vger.kernel.org, AJvYcCWRszQjlLI+juEm+DcuCsNN1ucW3Zxl7iL8GdtNWZq8z6/4jTUppoY276l6to3GGaY+TfmgtvfJFe/CZzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxImHOYBo87CIfgUuL4sy8XAq6Zvu2UohjmWSGuc3I4u+6Fj3Bm
	XgwkC0xlgih9hzutCEclrpQ0rMsblJoGsHMe280jo1Klg7y7LzjstnnTnvZTEVYbMUci1oswiaN
	xM2XO2INbbYFASKW35jPFBLmnFS8=
X-Gm-Gg: ASbGncsK9/G9WdN3FzFNRQJ8QIiVFwhctNqyWiHN55oHClGcs6WZ7cGGzzDQnfl91Bb
	MLx0J3xrhov/fGfqdChWAhEBcV/VWO2jLzhvOxQ==
X-Google-Smtp-Source: AGHT+IH+hokT/0jduerO0+v/eqopaN/jImuH17gv94REmY5CpjnE+Q5YQ7NR6XJKbSqr6IRMP4k3lAChOnkalbsGc3A=
X-Received: by 2002:a17:90b:4ac3:b0:2ee:35a1:c291 with SMTP id
 98e67ed59e1d1-2f2e91dd08amr487037a91.3.1734481132171; Tue, 17 Dec 2024
 16:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217140939.08167c85@canb.auug.org.au>
In-Reply-To: <20241217140939.08167c85@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 01:18:40 +0100
Message-ID: <CANiq72ktR0-P3q+FU9phgMRgXeFM56SiYQuH0O-sqf=O=rK=5g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 4:10=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry, I missed to reply earlier, but this looked good to me too.

Thanks!

Cheers,
Miguel

