Return-Path: <linux-next+bounces-4749-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E609C4A4B
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 01:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0ACD1F22327
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 00:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FA71C1741;
	Mon, 11 Nov 2024 23:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNWrv8C2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBAD1C1ACB;
	Mon, 11 Nov 2024 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731369474; cv=none; b=E7zzopnmvjza2q7CeFsPlnJbHF55aFHcV7Qlud2oDSuKiPwY+o/GGd8I5Hi0gqs2+K2nqOvMWAVZw1ltVHGLdIjN2e0mjIDJAGazxWpsoZruVyl6Iz4hUAADtOmG5PrGmLzkA1kYAvj58hHjMn/K8Pa5I855vlmQWR/jGUaMCZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731369474; c=relaxed/simple;
	bh=nVJruGthKaiBtejm+X7QfNT/sTlSa+5jP5Xfm9VYnqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbljK45wFK2Iwpz+WpCZN5+IXegR+tPO/gE8WDd6RCDLzH8bOmA2RFoqQViAD4V+eKWH3PBov0/W62WNiuSRKhqCf6qovT1Ju5JivhnndPrj3KK468tx6iSZgbKS602usnAN0LI8l/fR2uPaBEpx62aS6Oo6o7HEDkZS5Bq37nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNWrv8C2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e56750bb13so15754a91.2;
        Mon, 11 Nov 2024 15:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731369472; x=1731974272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVJruGthKaiBtejm+X7QfNT/sTlSa+5jP5Xfm9VYnqg=;
        b=lNWrv8C2EgslBzZpKNnU9hdxqkPciDmsCYzK3xU5jXGmeARjCMMGVSsb3LR0PSCmpw
         X8ggfXwVjURrdhzt0zo7L+VomJWeBq8snKpotdJnV9qvazHJYY/Y6zEhiRsjhuzJAJmT
         /wpP5SGFZroVAZQz0HrwAOziw8+FPVoq+7OZB37FWdB1tbWcl25E8ub/dWNFeBtG4DOi
         9t4T/0zuNRnRbRiBftaD5ejaSv+E4XQv0KJPXzYDCZRPEgO/Y//eECLUMebIg5qpXJ4f
         4g0/nXKFKWxmZe7UyNe1Zw8WOhLn0QuTzF1FDovB25+tS+lrHrQue67Xkt3inpv6lgUi
         PCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731369472; x=1731974272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVJruGthKaiBtejm+X7QfNT/sTlSa+5jP5Xfm9VYnqg=;
        b=iyDv9u3nqDkfhHD68Btajex88Jv9EAtlT3FfF+M0iMPPBOkoRQCi70JBHdUlHCyvPf
         Kkoi9+1Ab4Q091ykRqSDfcN/2+io/NNo70EJpCffETkFEJ25XtDaF3gfUfgd/fRb7T/a
         scaNdaBAiKYfJeYKD1kXMTalr3BT2LFwVAIBOI6aXao0THgNAcOKFaHdmRdppGktlvlx
         g77uQ+8zhMiKSvkPE+nxxm2qIrowevp8BfTCQ9W2L5+JGuCN8SRDlpn8Rsw+SeQcnT2f
         c42eGI+zYYAC7WAJ9Gx4cWxz+U46fonJC0LYWeEyYW4yU7bk34xHe2epSukAR5XsoMUY
         Nt5A==
X-Forwarded-Encrypted: i=1; AJvYcCW3pyJSmy8YNVS/HdAkuL0ts4I9Iv4cUTRvRizFOA5lEQXFixa/pWpkDadoX4zK6zRj1A1Zrz2/tWBQTXc=@vger.kernel.org, AJvYcCWuMkJjRKJBWVk+xEKVdrU53CUW7dFUK4xnnOFHQQCcmCuBICODahbXnvg9P98RQAnRPMBu041VYha/BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfJC7R2sJJaH3KfLfXInEQBCmuw8FE02tqUzpc5HkZ+4dfdNv
	ddFpUslgobhmZrD7ZeuyXpM9czFQytyvoGvjolAMIQhz3fOr9dmFEpoWkKPpJ6BkzkAVBnqFAWv
	tJxp+GHFw50WDw9EkTcaX3x9tX0k=
X-Google-Smtp-Source: AGHT+IGFDcDTKx3M/emaGc5dZ5WcqlGL9KFXHtwP+tTBNxwGDsij+/RwOCzUzedM3mFSNbDvGS9ACKOJfHIJ0HhHifc=
X-Received: by 2002:a17:90b:3b87:b0:2e9:4a0c:252f with SMTP id
 98e67ed59e1d1-2e9b167f7edmr8065098a91.1.1731369471885; Mon, 11 Nov 2024
 15:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111172947.63ee16dc@canb.auug.org.au>
In-Reply-To: <20241111172947.63ee16dc@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Nov 2024 00:57:39 +0100
Message-ID: <CANiq72kVM03hWMxj92fL94Cu+jF8fOKZVotypfG5TheFzLnWJw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 7:29=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (I think - see below) and can carry the fix as

Looks good to me -- thanks!

You will get the conflict in the upcoming round again, but this time
without build failures, hopefully! The hash has not changed.

Thanks!

Cheers,
Miguel

