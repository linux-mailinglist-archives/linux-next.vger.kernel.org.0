Return-Path: <linux-next+bounces-9140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40121C7813D
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 10:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 041A431EAE
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 09:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A642D2BD11;
	Fri, 21 Nov 2025 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHO5cKFh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF32309BE
	for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716544; cv=none; b=uBBhFghDExk2EByQCSEXpXWiaCvXapU7k1ZMvW+5X5ChkVFSrLz+taOwopK5IlUuachQZAhvvnKX5E2+HCp4OsleW19FUoOfcGRogw0cBXtzdUFiICDw4IEoUB0jk8Ioum6RFNjkeRPEOHUncOuChCIyT6ReY4zA9hJhnfUy0hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716544; c=relaxed/simple;
	bh=QaD00ch2Xm21nSmLRtDru6YG2xz2fbIJHvefSp7Fa2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuXPYmgZdpBFyuan29EQyWU21hFaItne2/WhdYPsEdzhjNQszSD8iEFrlC1RKGA10JVnjpGlqdYongctM8qeCwnPfwf2AF3qPMfMaOO3BPX5m34nZTNvYnKsvl2I51IUhadVCKx4TYAxCIjKffBV6dCWIpeH9hCRmmIXhfab1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHO5cKFh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b713c7096f9so290129966b.3
        for <linux-next@vger.kernel.org>; Fri, 21 Nov 2025 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763716540; x=1764321340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IsCJj238uLsCT1LMa3YI8Doktc/kYSD45gyn3f/32w4=;
        b=IHO5cKFhJ2vaiAQ17tNvnqZslMDfJOuVBnpRwx+YYk2/f8QJDK0MK9ZHcxnjT4onSn
         L4ohHzWgAu+8iGUu40h+1yoMrkd6Lb+YCMX+9ptgKZFHN5swKGb/oszannVNh/RRZXoj
         ETVi2qhxxLlRfdUIclobaQv/tDTrEsCYNEXpDl7zWwqSlTZRecieCBm2GOd1ikRGnFPu
         Y5uXWgoiL1b6WTIzX2qTuhQO5HXJ7R9EnqvNHknxJFQchgyqwilHJ8CrXIn8GRtOFG/n
         wVDTWGM72g3teogBUHr9tc7adNEQ8YfarTWzuAJIpRBoerregykWVN0tSavlgwF+nU+1
         16Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716540; x=1764321340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsCJj238uLsCT1LMa3YI8Doktc/kYSD45gyn3f/32w4=;
        b=NTlY5/yE4SULvg/uTKM9M+avr6+Qgnfn68WlY42IWocD0kqfsHah9bpePQ6gyiWcaJ
         1+clpAiAt6x8xj64MC491C35im5M4zyFcWCDzeIBCcwi/6kllyXIcBw2UTQLHwbuY6iI
         6mTF9+sZjpSU3L9f0ALaizW+6tj0Xc3/VFId+YgLTkPPRA2Zbs8VO3XzcB8GeXD1TjX9
         2wNyEbUjbpH3bNA8kom1YKbCPr/xGRaZZBQgrPpu/i4iXJaR7dWoZHcwvLMnALPXFRLq
         0yulWJ32koJCXnnPNyBEYkdXzpS3vMKUEeGMqAI1kjzs9ESwV8/3bG/kprXB61l4Uenk
         xoDg==
X-Forwarded-Encrypted: i=1; AJvYcCX+bAXFCnFKlhq4essXpIRF7Z3e9I/p/Alr/yB+xkozSOsgoeZVS4RmZRxaTHLrRH8Tmm/kG4ECD61C@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+TWtZcSxFNJ4KwGhnGoc8tSugHrhGUhlaPrIKLTCSmouc2lF
	XGn0Iiq0iTY23/XH2MbTmwep183C6Q4mbZgFixAS5prRRZ9DOpFzFP82LCD8boSvUx1T/ndBpwh
	I/YvjCGLAxXGdkfpWI2oGyTPwKN5TNyMakkloUyQ7AA==
X-Gm-Gg: ASbGncvGOJ4UxU6eIT8H1/PrH8UkgmiYNmhsiUXHmd6vi2siJ0dwyVJMhz+wb6G1wF4
	uDseg0UsWwg6hAcBNr8TafAPZIVYz7Qh9hsrjWz+uJce9DLqAFuNmxdkMCssKRiNdItV3b5x9Hx
	yyzC3TA9HuiO3eTjFhpCDAx/9GuScicMCQiXOfEg8kk0bEp2EPkikSFDtA0eww+kSL3/xoea4+t
	hH/s0UuYj4SoM9pMJ3W5x0zBRd3s/aQXsOspfA8Y9mWaSHtOPC8NKI/aVfrzTnFuwc835/gyu0J
	sQgX7rM8ivEg/dNuBRBfrMkfO94=
X-Google-Smtp-Source: AGHT+IGKOu5/oklHXBGkous8j5S+i/SRdtuxResfZBaYf14jRrrrYmCio3MQgI2OzH23c35Z//q8Yyyq7K7WtZEPzpw=
X-Received: by 2002:a17:906:c144:b0:b73:572d:3aff with SMTP id
 a640c23a62f3a-b767170ca03mr146641066b.35.1763716540240; Fri, 21 Nov 2025
 01:15:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121111534.7cdbfe5c@canb.auug.org.au> <20251121145042.3cef6e7a@canb.auug.org.au>
 <64a9b0f21ec290cb9af5887e8ae46b90ce34edc2.camel@pengutronix.de>
In-Reply-To: <64a9b0f21ec290cb9af5887e8ae46b90ce34edc2.camel@pengutronix.de>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 21 Nov 2025 10:15:29 +0100
X-Gm-Features: AWmQ_blpiQkYkpG5BjrciII0sTux92wiU1ni4DIebbY54xG5yaAIarh6wRU9qPg
Message-ID: <CACMJSeuE9-t+wK3WY96oO9zJA0vv=vrtW+VFKtuKTrxXeT=mKg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the reset tree
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Nov 2025 at 09:22, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> > >
> > > Caused by commit
> > >
> > >   d7cdbbc93c56 ("software node: allow referencing firmware nodes")
> > >
> > > I have used the reset tree from next-20251120 for today.
> >
> > This same commit is also in the gpio-brgl tree, so I have used that
> > tree from next-20251120 as well.
>
> Commit d7cdbbc93c56 ("software node: allow referencing firmware nodes")
> renames the 'node' field in software_node_ref_args to 'swnode', so the
> trivial build fix would be:
>
> ----------8<----------
> diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
> index 29e8b5432f4c..96400dec0baf 100644
> --- a/drivers/platform/x86/intel/chtwc_int33fe.c
> +++ b/drivers/platform/x86/intel/chtwc_int33fe.c
> @@ -77,7 +77,7 @@ static const struct software_node max17047_node = {
>   * software node.
>   */
>  static struct software_node_ref_args fusb302_mux_refs[] = {
> -       { .node = NULL },
> +       { .swnode = NULL },
>  };
>
>  static const struct property_entry fusb302_properties[] = {
> @@ -190,9 +190,9 @@ static void cht_int33fe_remove_nodes(struct cht_int33fe_data *data)
>  {
>         software_node_unregister_node_group(node_group);
>
> -       if (fusb302_mux_refs[0].node) {
> -               fwnode_handle_put(software_node_fwnode(fusb302_mux_refs[0].node));
> -               fusb302_mux_refs[0].node = NULL;
> +       if (fusb302_mux_refs[0].swnode) {
> +               fwnode_handle_put(software_node_fwnode(fusb302_mux_refs[0].swnode));
> +               fusb302_mux_refs[0].swnode = NULL;
>         }
>
>         if (data->dp) {
> @@ -222,7 +222,7 @@ static int cht_int33fe_add_nodes(struct cht_int33fe_data *data)
>          * rely on software_node_register_node_group() to use the original
>          * instance of properties instead of copying them.
>          */
> -       fusb302_mux_refs[0].node = mux_ref_node;
> +       fusb302_mux_refs[0].swnode = mux_ref_node;
>
>         ret = software_node_register_node_group(node_group);
>         if (ret)
>
> ---------->8----------
>
> I assume it was expected that drivers don't modify contents of struct
> software_node_ref_args directly, but rather assign them with
> SOFTWARE_NODE_REFERENCE(), so maybe this is not the correct fix?
>

Yeah, driver definitely should not be doing that.

The comment in this file:

/*
 * We are not using inline property here because those are constant,
 * and we need to adjust this one at runtime to point to real
 * software node.
 */

Indicates something's wrong. It looks like it's waiting for a software
node called "intel-xhci-usb-sw" to appear in the system (as in: get
registered as a firmware node). This is clearly an abuse of the whole
concept. I'll try to figure out a way to improve it.

Bart

