Return-Path: <linux-next+bounces-7257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3EAEA30C
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 17:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAC1564621
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 15:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63BB2EBDD9;
	Thu, 26 Jun 2025 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dvpT8Q1X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA22EBBBB
	for <linux-next@vger.kernel.org>; Thu, 26 Jun 2025 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953423; cv=none; b=mTv/nwqwRTHuqmv8snmjgIH5Hcajp7RUiNTt1CB9JJDeYaQC4WCaPLN1+4G39mTw+IsjW42LIeyd3EP0vnIBmL7FsGdIx2hvh7Jfz/Ik490znSqVxmiyBYhDfkACnn1Pu3eCmk+02lu3h4i1VyRNKo9OixDmCIa9m7AevJ0LD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953423; c=relaxed/simple;
	bh=LUc67/E9VCr1cFPrdu697pB+JoTGoLf53uACxaIJWlI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f37kR53LUoxnUknKTDI4v2two7gejq31ahrXlQJyzxHkh4WEvyXDzALJU8d5SyP1WszPJTgbfHUpM7zdsWxWCzSEHJjCIRdmkdOXvi0uNONivkh7aewEgDioA4zjK63+6Hd+KYe5maJYJVNNOQ+ref+mw01SKJcqmhRrbouvF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dvpT8Q1X; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747ddba7c90so948180b3a.0
        for <linux-next@vger.kernel.org>; Thu, 26 Jun 2025 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750953421; x=1751558221; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kK26JsfMXG5BvdX4VYTi37MDUraLIqNaNeqi3JbJPnw=;
        b=dvpT8Q1Xj/WipTKieyDqknq83fMyPbRYYmcULt5ZMt5raDmme8EEhAjCvm62gK5UsM
         9ykNmUL7g5vEYWFgzqgOH+CDy81HBvKUK0RxCTqC9tidZqszoOfk1NG4RDik33JjbdyT
         c1MMxZmMAjLkE5Nu9FQwOqh+7VNSijugUHQO2CbhXFOMCUStxFeO8+OcqUuygcny6CSY
         Sk3HjWke8jA62WsuVRlPDcIORnQ9H3asCbaGREejHhwQIfBqcC+L7jnFO3CQsNagrY5r
         rPI4l0UKKXc+kgV5aa9HZbcfOnZ/MT/lc39q0ycDaRZYLoasOQAa8JfwyRI/ekj3+kPX
         QQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953421; x=1751558221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kK26JsfMXG5BvdX4VYTi37MDUraLIqNaNeqi3JbJPnw=;
        b=hxWH5q1WP1H1CSM2Xo7aNSJ0Zqx2RF3ABNR54oA8OKfnKXHrvWJ7wO5z8RAKWJ8gXb
         QPmf4iu1tHK9vosR2i24AhQHVMahAsqcUQcdCGQUNkoomm/hXK9t8rVGg/igdkXCsUG3
         xTDqE0Sa1Ko6R0C/OJK/ySCM9c80r84c2cYqF+hryPE0sziJZGNRq/6feV5NNOzu1T9R
         Odz1CMRNijT/qI4pzr06c87EGntGeG3eC+J8BdWENSnySaZ9Btpa4MQhnpEb1Gcq8bAg
         TzS4qIx8WALqeeZ+sbAoXbJ2w+TZt9cpoPEfdJRkDPo/yhMz6d0u9Oxn+Pa549XDsVWw
         scmg==
X-Forwarded-Encrypted: i=1; AJvYcCUQknU2Epr4ZjMWgnPAWzRNse4/HrHb5GYSOAYv15tZghfWdqHb7Fpl7Q2ENBUu7VHxtYmiyBFRAOwN@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoFLNko4C+H8cgvD/SWjUWG+STCYHA1PDmHMolz7HTBs3Pu6p
	xtF/3MDwjsQ6G0iaHII6Ulu6j0BfLOBlZpN6K1sRm7nvYGnPI3nzibnlLuuUBg/h7GRHvy3iOh6
	ahXEyDA==
X-Google-Smtp-Source: AGHT+IHvg2ZJs047RUMluhVoHunFXZhJgSyqtLpN4GzPeZZFYmNAnKpFGRIVktoxih0QIuHcT3viEJm6py4=
X-Received: from pfbdw21.prod.google.com ([2002:a05:6a00:3695:b0:748:df06:a477])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1581:b0:1f5:6c7b:8920
 with SMTP id adf61e73a8af0-2207f191f5fmr10726625637.9.1750953421474; Thu, 26
 Jun 2025 08:57:01 -0700 (PDT)
Date: Thu, 26 Jun 2025 08:56:59 -0700
In-Reply-To: <20250626171004.7a1a024b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626171004.7a1a024b@canb.auug.org.au>
Message-ID: <aF1ty7P9MnQK7UPr@google.com>
Subject: Re: linux-next: build warning after merge of the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 26, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-x86 tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/virt/kvm/x86/intel-tdx.rst:232: WARNING: Title underline too short.
> 
> KVM_TDX_TERMINATE_VM
> ------------------- [docutils]
> 
> Introduced by commit
> 
>   111a7311a016 ("KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM")

Fixed (assuming I didn't botch the fixup).  Thanks Stephen!

