Return-Path: <linux-next+bounces-7554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A84B057CE
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 12:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06FC616EEFA
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAE92D6414;
	Tue, 15 Jul 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRmZhORf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8372253EA;
	Tue, 15 Jul 2025 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575387; cv=none; b=syuBjnpzwGKObzXKQDALMpX80AAfTXWIw3TKCQfW9CT3NbtNOYIEvpK9Nb4qH8Ky1wHT7afjbb19VulpSumNCEijQDHx+MwFLqgEkla/CTIMyd5/Q8Y8NiryzLTm61wk8jZbL9gdEDUX8ahTpWCYOP2HnGgWtnkoLWc6V3W8ot8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575387; c=relaxed/simple;
	bh=dc3AIM+TGEoQTRr4Ycak1rvWyax6LdCDfyKxVSnQf98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfpUseRJBK92p/hfNt/2wCvDvOgzraP+HzyEEwH2cxnmSg8WwT2V5B4oPOirwjMaM1kyA68SDQHrLocxM/0d/Z2e7zeJP259u1IqRNR9HGXVCyLaZMLV0fyGnH5IT+ON4z/AgyNhUdC2IZPVafre8ahSd7yYllKMFlaW/eQ8Jek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRmZhORf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23de2b47a48so5704445ad.2;
        Tue, 15 Jul 2025 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752575384; x=1753180184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6nEZxV0x6qPDN4VqdfkMdiP1W/dqudVcE8b0cRvo+E=;
        b=ZRmZhORfQspj2Jhe3rZbPPVDhzan+2FyG6jlZLfQB6h21sgsC6nk5PLgz7cd7SqEjG
         tpaqMDse39GfJ2nJv5N4Zybic0o6i2RJcZgdgowNrJDeBrBD6dvh55zsqZE/twwe1ujK
         4kTR1nNMxlkBkyKvMCLUhxXBrfEGuti59UBh0yvIMERi4+MQ3/qT7vGmtDbICvauB4ym
         KV03B1klYy7pKyd3gm/fMuQaaAnV7xCjUTjbQXPJXH83M5gvpavV0/4sNGm8l4freivA
         cMm9HNnUcD/fdlbp9vvbR69IUs5RS4HUkXVbkRBv0Wa1ZOGrTx3OFy1NDyULC1QcE2a6
         aqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575384; x=1753180184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6nEZxV0x6qPDN4VqdfkMdiP1W/dqudVcE8b0cRvo+E=;
        b=Cza/HDZWDfmtUYMbKYGV8X3v/lDMfwVFxEY7T0jMF7se5Jjvqgpo01/hZGxyY5017A
         9AWi+bBt9joFbwbIERtdXQcSD5qoq07eoyw2hx6p8euC1DesyCyFa+irJc8/T357IVOd
         2qi+t7igRy/iPZ7XQ9GsuH+AP7jjR2I9COH/Fvm9DA6hFG1JbNDa/5sqLRBYkVtNGocM
         TZAUhOdD9RNSK3cuCpYw++Nof4IDmk1Zku5pL3GCh3zPukeqY9nNvinsGioc4RgVSEE3
         ZIzOhRG+msMhZansbM81qca7+QAfuT8JWg08SJ+kh8AWYaC3X3rqkC/TqGU27OE3OXTZ
         22/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3qeJQcynTgYIlbDp1CnklpP5UPgwJJdRkylI6sYaJImfVBacxfFYaUWLUAqmbWmbJ8FpS6QRKM2tQOBc=@vger.kernel.org, AJvYcCXz31A0WhAroQCtEvz1cG8ekGZSlxpqLRCIJ2fJFu4N+PwWpQFG7K0q4HIlMv7xE9Ypzqri4M31OcMGPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95sqXGi3BbI9ERAzdW9Y6sFW+qMwsiJFnET/nQd+LpYowFium
	9G8eL+eWnkd7dmK1yxL/LTEXhkh8fFmG6kYXUsbyI8UOVyjBR4DJNPszGpp5O6ktYgkJrMY06fe
	/mjBuJHqWi1CwIBWpWfyR9H1pQzl6/a4=
X-Gm-Gg: ASbGncvfHEsFM49zYCt0JO/AhS9LOF5MRt3BZJ+WTEP0HV0pvMkMbzIFb7l8z6yeTr8
	v8nsWqf+w9ZKFSF9wCWcSGXLz0kI5B9j2dId3B728kk+GtgPtKgn1WLztZe/q2Kr7TvrZAp8OCT
	k8PELsrPIfMW5DRtd0jnLAmK/lxZICHzzDbnr1Cv/NX8iX/Hh0SyVs9pU82dMgza9YUmWGXsMrd
	PMJ+YLV
X-Google-Smtp-Source: AGHT+IEQ06BMgrcq+Ksiy7kVKz5aoUs6O3QP/s7TgJm/mQdVJriOpMGnELO4vN/Ygxhr18cEZTunUQZfmJsVYJK8at4=
X-Received: by 2002:a17:902:e88a:b0:23c:8f17:5e2f with SMTP id
 d9443c01a7336-23e1e8e5e19mr8287415ad.4.1752575384103; Tue, 15 Jul 2025
 03:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715180913.735698ce@canb.auug.org.au>
In-Reply-To: <20250715180913.735698ce@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Jul 2025 12:29:31 +0200
X-Gm-Features: Ac12FXwxRrQM3KgD9qGHyLKXPvw8FdG9Gx2pQ2K_GNk-N0XTAKusTr8JIhppfVc
Message-ID: <CANiq72m9e4_sGXaXr3Pff=PrD4iLHk9O1zdfPX=83V==iL6rMQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the vfs-brauner,
 driver-core trees
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, Greg KH <greg@kroah.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Remo Senekowitsch <remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 10:09=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/helpers/helpers.c
>
> between commits:
>
>   6efbf978891b ("poll: rust: allow poll_table ptrs to be null")
>   a2801affa710 ("rust: device: Create FwNode abstraction for accessing de=
vice properties")
>
> from the vfs-brauner, driver-core trees and commit:
>
>   8ffb945647f8 ("rust: helpers: sort includes alphabetically")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel

