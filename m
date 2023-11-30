Return-Path: <linux-next+bounces-135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1957FE4A5
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 01:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4B91C20BC4
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 00:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221867FB;
	Thu, 30 Nov 2023 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBA6CA;
	Wed, 29 Nov 2023 16:11:58 -0800 (PST)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c210e34088so343103a12.2;
        Wed, 29 Nov 2023 16:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701303118; x=1701907918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxF4apxaJBlvMUgBtSsnqaTgi+B++1D1aOFzjuMj80I=;
        b=uu59/6j9Oa9k3+pGZX/3EvYmVB+n9jHP8BWKrhyO20FEAPJONk6s4OdFco0EMTjHur
         sClc4eJrM5dtqX6z71xmtrE9Wg+fv2SPIPy2dRU66JnnTtEFkj8SuPqbDVuTCT4HTgcD
         ran4+SbZCsLGw8NFowvpGltwomz4NlyAUc9QtUxnprJlmnswyMn+IREE/TBbYUzxI0hQ
         oAci2n3S3cqC0VSeBGY6Yaf69cZfAtLBevmA+iKNnEtd27jHg/9uePG7lUf75KQldPCM
         UHPlGO9dASxXjtUcQ3kqehRWy9vuRGgQfR8brUhMyFj1seHdkdK5e7vY0LmBwgLUTuFJ
         tc4Q==
X-Gm-Message-State: AOJu0YyZcLoju5hUtheNHUKLI3Lb9vQ39x70TL4arzesbIOUSLUjWPcr
	evW11uF/eAboTt+JPr9B62j3uM3WtyM5gAplFJc=
X-Google-Smtp-Source: AGHT+IE+Uk+v6x/CP9oDnU2R+Nagu6RhFvYt93IMb6r6YRUzDm2f5MWzuHMlWKUAOzuDGex41XzfChKG8xOI+nKt7vE=
X-Received: by 2002:a05:6a21:999c:b0:18c:651:67fe with SMTP id
 ve28-20020a056a21999c00b0018c065167femr22234124pzb.62.1701303118285; Wed, 29
 Nov 2023 16:11:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129085314.50306434@canb.auug.org.au>
In-Reply-To: <20231129085314.50306434@canb.auug.org.au>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 29 Nov 2023 16:11:47 -0800
Message-ID: <CAM9d7cjjZBN1FzJaS5TWaC0=_gE5aQ6j=eVjiHd9GZaaf_0mdw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the perf tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Nov 28, 2023 at 1:53=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the perf tree got a conflict in:
>
>   tools/perf/Makefile.perf
>
> between commit:
>
>   e2bdd172e665 ("perf build: Generate arm64's sysreg-defs.h and add to in=
clude path")
>
> from Lius' tree and commit:
>
>   1638b11ef815 ("perf tools: Add perf binary dependent rule for shellchec=
k log in Makefile.perf")
>
> from the perf tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for letting us know.  I think Arnaldo can resolve the
conflict when he merges perf-tools into perf-tools-next later
(but before sending the changes for v6.8) as you did.

Thanks,
Namhyung

>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc tools/perf/Makefile.perf
> index 058c9aecf608,824cbc0af7d7..000000000000
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@@ -1150,7 -1151,8 +1168,8 @@@ endif # CONFIG_PERF_BPF_SKE
>   bpf-skel-clean:
>         $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETON=
S)
>
>  -clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)=
-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-core=
sight-targets-clean
>  +clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)=
-clean $(LIBPERF)-clean arm64-sysreg-defs-clean fixdep-clean python-clean b=
pf-skel-clean tests-coresight-targets-clean
> +       $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
>         $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-=
archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
>         $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd'=
 -delete -o -name '\.*.d' -delete
>         $(Q)$(RM) $(OUTPUT).config-detected

