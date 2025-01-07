Return-Path: <linux-next+bounces-5081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDA1A04267
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 15:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF092188987E
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 14:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED661F191B;
	Tue,  7 Jan 2025 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4vIlUOR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247021F1917;
	Tue,  7 Jan 2025 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259841; cv=none; b=FzKfmGsXOvVA3VaEmtO5V+BMeHLs6L63A6+DEmpGiaSkA4IKSQWvcepNbKGMMb8uWU45JRKYbkPHpNfsZHoLDBb3k+/n7EfCzZ+5RGUhufx9DXVCHWxpJH5ZJdlYk1S7TDLNMmpgGzwdBrRVGBK2jN1MF7Vd0O4uDesi03Pr7ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259841; c=relaxed/simple;
	bh=3s0c+crBK8tWgrdWfYELdjhCW1axg8YenxmQTozhi00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZJx05U4puEUtFecyvxQbKykCRYkKY6+s5fW1VaLjA95hEaqNicnGK4GloDVcMvouGyCTShle7GF5VkoN5MmROpIYapZAbBV4LCAdvmhKLXXdK6SPOs4OFhBRWM1JL7tZpUqwmaF0z+etfOVBzWBz3b8MedqLW6txfJHIA1NRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4vIlUOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AF7C4CEDD;
	Tue,  7 Jan 2025 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736259840;
	bh=3s0c+crBK8tWgrdWfYELdjhCW1axg8YenxmQTozhi00=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B4vIlUORzzFYzV1Vg9+3NR3AdtMg0Su4Vw/Io8c3wDeYaRzBvdIKDgGuZjQM0zrHU
	 BlyujfWyixXTzLRnOMcqHjy0cffZ3bjglF09Aq1Yre+JoKU8w88fPToiRevSUO5Sfi
	 RuPhyR5t8D3ID+cte812USvOkAy/Wp+bumvjZt0GpUrkgEvAItDjVsaiTOIoMuX9Sn
	 lhGb0fitFlaMmaSFNmSn7BtbTaRID9aY+4bCQ4XyYWBG92RhAfc/9pWH1Y2fhZTh8n
	 lN4cX4/Nmxo+4g6kjBLVhu4bD/RJrZDuE0LMxAhQWZ+wq+4zjn7JbjgxqxHAjFrIhE
	 bOW8CxR6LEL2A==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so9547636276.1;
        Tue, 07 Jan 2025 06:24:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPg7kji2iQ6WeAWu2SNsCNsaV/aoI2ubHsNrQpb4/etO+uIwsOJ6Y6iGVkhzJe/tcodtU6OPExGKj0gw==@vger.kernel.org, AJvYcCXjyDIyPfbFz0ilLte2ddy0DcOeu9UbPFjkpFWpZHDrfutpMJrZB9f9WzFDGeyquthycRHqU71+tkvYv6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWkUKeYOCQQvFrXm2V6kWA76AZW/SShMSPQVfjSd2O0FL/bF1
	ldkxdmtsyB2NjE2O3+dlQjmaduNMI0t2DBIzIiJajq8Kag9YzvyYt3zlCycFGELxPMQYr3yLZa4
	K3iBgjm5h0XrHPXxzWHVuOFRRVg==
X-Google-Smtp-Source: AGHT+IGRFuY+PBBNQlDd4dkceOBkwzAz2rPnnLVSjTFKF7qJtVLcQ1QlHn3hENBlff1yRyI/sCJJCgICotgF0zOC2tc=
X-Received: by 2002:a05:690c:4988:b0:6f0:21d6:44a4 with SMTP id
 00721157ae682-6f3f81229b2mr430369127b3.10.1736259840018; Tue, 07 Jan 2025
 06:24:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107152038.02dbb1b0@canb.auug.org.au>
In-Reply-To: <20250107152038.02dbb1b0@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jan 2025 08:23:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKY3=3innuhYbzGFwF1Jp6DO9709yWGyP99XrEviuhE0A@mail.gmail.com>
Message-ID: <CAL_JsqKY3=3innuhYbzGFwF1Jp6DO9709yWGyP99XrEviuhE0A@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 10:20=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commit is also in the watchdog tree as a different commit
> (but the same patch):
>
>   d3571aa59a61 ("dt-bindings: watchdog: Document Qualcomm IPQ5424")

Now dropped.

>
> This is commit
>
>   b3db0b5356ff ("dt-bindings: watchdog: Document Qualcomm IPQ5424")
>
> in the watchdog tree.
>
> --
> Cheers,
> Stephen Rothwell

