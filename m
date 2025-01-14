Return-Path: <linux-next+bounces-5199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E7A10242
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 09:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61AB63A9ED6
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 08:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A14284A5C;
	Tue, 14 Jan 2025 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISqU5JBT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B221CEE9B;
	Tue, 14 Jan 2025 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843986; cv=none; b=TlQzhJxHLVDi0re5k1tGU/DbbIgc0X3sMTONhWDhUxSAX8h2iEQ0h3izBA2otclWd+XTtOHmCT9reNtHNQCPTEKDBwWIyRiDfHVx7GeGr8TkkqQKmlUFJ4i/csQQtHRfzGd/ttnPVhRx5lgkdG++GbUCgDm+l05O11kJXofgXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843986; c=relaxed/simple;
	bh=lnqwUrYFRJdxzwACLywBPuLzyVbMQRNu8sgCGUkDShQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOeAcf0LEphLoxBuV8QnCLkMdvNjRlCkmBZ6YnSr/txbTIgmAQgLF0KDl8D3XvTTcK7dlJ51QONx5cdB6LXljO4eZ/b1SOVYFXkivJ6tDKRPFZQPFeMb0bnLDuWIw8t654J2ooOutTH8/exnpJidzxaC9zj1yp2qMVi9tLIdLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISqU5JBT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee4b72d4d8so1073005a91.3;
        Tue, 14 Jan 2025 00:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736843984; x=1737448784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdaPQOG+jZl+QzszmKjWuwCDq3PKK+nnIPtoJurL7Fo=;
        b=ISqU5JBTHHBVfNJKOO6e9t+lE7lQRa8a0q5O4MwKO0iiiLGc3PzInXVq974J5siaGQ
         kD+g17uTOV4akDKuDL1m7/PFxgWG08z0QIDI5BbjIxiJ6jGaMjIeKvEWVCmV98V6cbn6
         gh+NcZz2CaYHsd3kpfqWj1XzMdI0009nYbRr9OUJlNuZRXw0QJ4s8XjvyJxxf3v+9bsd
         0oh2Dfsc0FKCJiiSCJ3b/ikKMOZLOz6/vqyNUa53wbN6aZORO0Ppqwns1lWi/N8nREz1
         9HlKgvoi8zgWJWo5s7ebyC0QnLthYOJ6+h1qjLzd075yNu4FA6s3AZMAPNlB8bDG/BXV
         Nzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736843984; x=1737448784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdaPQOG+jZl+QzszmKjWuwCDq3PKK+nnIPtoJurL7Fo=;
        b=iXkPCh3z/xZasuClAeGuY5OgOINBN7UhorxF5fXD4do+5IOuRWTiiBwD9wwYaCGyvv
         VAZYXj3Dlug8SeFdkuPp3oC20XeHixAuJV8h6cQXLwq7TIuAk+Chnoxiwdz7USmK7oXQ
         dCMQ9Hr6XfkSj5cO/PyxR+5UhM8BbkQMnAYpQ1teRXxhjgHCzTxZX3gNd/BlIoHnFSxh
         c3dDMKpahoNAvFn0oGuFJTxq4IbNBlWFauFnQL8xw9YZ5Pno147HqWcnvD1iQi4Z0Tmx
         5fp+EhNYsuTroKpkr8x6cKmwDaFgj2LLRepCWk/G+edueLu+RA+RMvzfr/UJrWYISvCp
         pa9g==
X-Forwarded-Encrypted: i=1; AJvYcCUQvZX0YoJ/HWDWSn2ERLTJkYOjcmc/6dsSPcpRrz676FsMI67Om0UZMfTQOVXaBP4epN0DyDMGZ/1MPA==@vger.kernel.org, AJvYcCWRUYQrf07AWSZODWZvje7GjsLvrGQ5cyItdopm+qN5v6i06nPyNDbDGsOphPuARUSi0ZzzUpUZZ1L1CCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2J+vJhGDwZKyvkNsk+BZIWCTl+qZakykvU+Zavy/R3kY9EbKj
	MBxTxpIuPVxytnp2orjyFv1WeoC8hj6fcAzqN9idz1dWmuIaZFoDNaLZ2iWbcS8GM/iCGaSYVhW
	yGn6vC6N0Gt0Lg6LltXvSRf1vubQ=
X-Gm-Gg: ASbGncusSefTBQRWPtIqLfubXnLdTapdSu275ikFQcCj+vqbeHq5fE5aoGOq3L4D+vJ
	WviFlcenHGFA2kkVfM3oQNphlaADkMmdiM4PJGw==
X-Google-Smtp-Source: AGHT+IHN72gJcTX0nPpXhNdtjRlpLYcz7TjdKj8WCSuW3qB0JarUDaMdpl6+yn0UzFGxeTf7geSr/g+rP4JmuGQ15bw=
X-Received: by 2002:a17:90a:d88c:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2f548f3fc41mr13428342a91.3.1736843984331; Tue, 14 Jan 2025
 00:39:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114154623.080e160f@canb.auug.org.au>
In-Reply-To: <20250114154623.080e160f@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 09:39:30 +0100
X-Gm-Features: AbW1kva2pyPqRqAIIMTR_aAc42-DdtqaYOlELMAB8YKBkXV_XYdRs7GAkJ6w-ds
Message-ID: <CANiq72nkk+ecotB0Dnn=0P3eORP2kiEWj2+4-X73D=4LYKuCiw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 5:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/miscdevice.rs
>
> between commit:
>
>   88441d5c6d17 ("rust: miscdevice: access the `struct miscdevice` from fo=
ps->open()")
>
> from the driver-core tree and commit:
>
>   14686571a914 ("rust: kernel: change `ForeignOwnable` pointer to mut")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good to me as well, thanks!

Cheers,
Miguel

