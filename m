Return-Path: <linux-next+bounces-8555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331DBB6A93
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 14:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 845964EDB67
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7219C2F066D;
	Fri,  3 Oct 2025 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoBYS/LH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE822EFDAB
	for <linux-next@vger.kernel.org>; Fri,  3 Oct 2025 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759493879; cv=none; b=IavQ4Ybl28+BVC/hdLsR7gsYv1t/osteJc4UMwLD2G2W11bnSVI/Z0sbnNuV2uOHLvy1xvrHsxhq9pT2VFO7uCv8xfodcAehRfpL8Ai1slvXiBF43RdPrPeMFd7/mBW6cofgLb6Az0W78y4lE1VWNVpcBWrYTqEQbmE6Tx3jWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759493879; c=relaxed/simple;
	bh=+Snt76doWFSgZXIi2iokf3aOziww8Z3E/0aceKrfcao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3maOAGsaI35AG9mcxhrItV5QoHUKlkCyCGrjnJsPMt2eLFqNvHsx2myw4Z2Pxdnz1NPCjtWB8sb1SC2sS42T94dStG1kw8fNlnXHX3WkcCvQulou8iG0UezcX2Ygzj8xbjHJArJt9b7KbgQXsQ5l9Pg9fenceJLVJL79aELOPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoBYS/LH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77615d93276so181641b3a.2
        for <linux-next@vger.kernel.org>; Fri, 03 Oct 2025 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759493877; x=1760098677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Snt76doWFSgZXIi2iokf3aOziww8Z3E/0aceKrfcao=;
        b=BoBYS/LHxye7V1HaD2qV4F/+tS7pIRnf/0Yqxz5s++vT0KiLzi7sv/jMa24V2+Mutw
         t3vQkDVmQR5NRYKbUGkfJjAJThCJm07yHi7ZQofF8+le0Y8k/d3yQClnYVeuSIyx9suU
         liB6bHdQx1Y4qVDxj1VeJngeFlEAi50DraOIXlXsKkxvgNY7DGOG1I8NZCDceb13xYsj
         thtdDObu9a4CmajJRbSb1t9zFWN9o8yJ34zCVwN7fnBU5ScMva3s0IxdknFi9rASQGwo
         +C4j3mC9YwiFJlL1W7O/fAAn4LsCUNstZtqHstXUEHlBHJ6/6n1SfcvlIp7W1gvOtyqZ
         G+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759493877; x=1760098677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Snt76doWFSgZXIi2iokf3aOziww8Z3E/0aceKrfcao=;
        b=uzOWAeHcAnq594PIfVCOMXnVRd+vpjCgmwKSaBTfDPhGXpmIZobBPqzOylLC2HKYku
         CKWs1/Pqp2xw7sztaXJ8lzM5/kzEhjaEqQDsWxU3w2ok7QREL1XVOhxUcRl7wRICGUbE
         XpUY/iY7Q6StWZ0qCdDPs3hp3pNQD5WsO6ZFiDVBdu+C21Au88iMVc21VTTaMY8uCsAa
         pkhAvAeFoZLd5lvdVqux5noMNlb+Ujj3uLcVeTf1PH3BAMQM5GU2tVZsnq74Vo7XNKdt
         j4BX6ZwPqGNpmOT/Ob6cjtOlG63ydp0DnGCunnnP9uv8dyJhJAMgCMNa0PMABpHW4bC/
         Vfnw==
X-Forwarded-Encrypted: i=1; AJvYcCVb/hX7fg9rrqwi06Q704tb4f5K8e3vAiD+4sC0vxuAGr23vUBH59C3H7wW79PJIkJlNEHJAdfw1h6c@vger.kernel.org
X-Gm-Message-State: AOJu0YwnPu9w2fmiPAb7W3IsfuQowZINXxm9A64cp/OxdJSysII+RE9L
	gWe8IT8IHrlkf79l48mgwLZlgnC3/C9YUuE+kRrLIY1lLhDGByjhmoeBKXe2C43PaSMw7eV/ZIO
	rDoXAkHMQj3jSDAU45y/aGHWLInbxGjQ=
X-Gm-Gg: ASbGncuxE+42047BMkB9Y6L62+z3bspYHHmsCT3Yyd9pS5CBM5OrLsZR9q9n/lNjbPO
	1TZiufH4x7YSu/o1GdIT3AmuotU7BEiLyZ+SrnGQJstLmiFb2prMRncoNNEhi27fxrkrAvY96Tw
	ngghGGR3JqHFey2tfo2vwBh84CMrvBL7BGYlpTIN3VRyIIayp8lLfwp3NUFWEU4gqJcHuSg7Xa5
	q57PL1yFw1D7lL4WzV+t9vxAJx7zvL58I4/JC95D2OEq+ywM+AE13zetfto5eStmnd7em33ugOG
	DsspH/qekfy0AgJCOjq8oFvB9tJw503sDUR2B0JgC1sLO9hJN0AabVaspVuKisdTnW/9474=
X-Google-Smtp-Source: AGHT+IGk9cSxGm0BGzdwFCCO/DKuyQBht69QJq0J1pfK+OI+/sNOGnF/SLBrETGQ930FwNDtwBkptP9IjGNbEMhvX+M=
X-Received: by 2002:a17:902:ea06:b0:261:500a:5742 with SMTP id
 d9443c01a7336-28e9a6d2779mr20951685ad.10.1759493877006; Fri, 03 Oct 2025
 05:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aN-0kfb7trsHUoVS@sirena.org.uk>
In-Reply-To: <aN-0kfb7trsHUoVS@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 14:17:43 +0200
X-Gm-Features: AS18NWDe2FuMclk-0TqZZ2NCKh26uw--IOmdBKdvjXlNAi6DqPTeDQ0Ce1wQxNw
Message-ID: <CANiq72keJ54v_qTm7TxoBhM8X=1xzN1nopkfG27G6ZQC=1C3-g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 mm-hotfixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 1:33=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> [Sorry, forgot to grab the diff - was a trivial add/add conflict]

Yeah, accepting both sides is of course good -- I see it in
07586604e097 ("Merge branch 'char-misc-next' of
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git").

Thanks!

Cheers,
Miguel

