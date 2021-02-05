Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C573108CF
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 11:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhBEKQW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 05:16:22 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]:53921 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhBEKOQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 05:14:16 -0500
Received: by mail-wm1-f45.google.com with SMTP id j11so5524911wmi.3;
        Fri, 05 Feb 2021 02:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QqT1VbMd0Hl+nCIH2Pftmu9UNxh+ri5ATSj4oal47T8=;
        b=s+nTYTTANbKOx1BwxDBbOQjB/2Oder7M6c3bKdDPSjHFsP85b5+bhW+d9oKlv3VyuJ
         bPOuBZcCoR+hlZ/WA5wINEyx9NoxmvKChmoyYMvNlo3SmzHFEnj6MQCHe5adK/NnKjVv
         xJXEc7jr1YplYvYjJPW4z/7oseh6AOwB4NKTiC3G5c1u+RqGXjlmFzfTgCoQu0BQVPPU
         u+fFw8UibpYWOUue4vD5DDEoPI3s1iIuWQMWeavprt9jEbxBO1JX5nB63JvG+8BfPMAj
         wXfULCZMzqdc816MxxXef0SkV8JgbAZzm0WDXSkoLJyXnSH6/dGAVfLIjWu/eWVCjtxE
         KLIw==
X-Gm-Message-State: AOAM533SkYPX/a8kwKYx1Bi/LvWUO0LP+iFxxOsP/vfHcZiH7h+Hf1Gn
        x1k+P4CAshou1vEvF98IDoU=
X-Google-Smtp-Source: ABdhPJzJPtImxISVzMWfcyfZ2V4sjHJjIzevNV8gq7uUcuCUEc4Jxwr2z68+YKorBsfNWjaOPQfSrQ==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr2866463wml.13.1612519999029;
        Fri, 05 Feb 2021 02:13:19 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id y63sm8277107wmd.21.2021.02.05.02.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:13:18 -0800 (PST)
Date:   Fri, 5 Feb 2021 10:13:16 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Lillian Grassin-Drake <ligrassi@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: Re: linux-next: manual merge of the hyperv tree with Linus' tree
Message-ID: <20210205101316.rhxbacowjq7bii32@liuwe-devbox-debian-v2>
References: <20210205190202.29c2b74e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205190202.29c2b74e@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 05, 2021 at 07:02:02PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the hyperv tree got a conflict in:
> 
>   arch/x86/hyperv/hv_init.c
> 
> between commit:
> 
>   fff7b5e6ee63 ("x86/hyperv: Initialize clockevents after LAPIC is initialized")
> 
> from Linus' tree and commits:
> 
>   a06c2e7df586 ("x86/hyperv: extract partition ID from Microsoft Hypervisor if necessary")
>   fa2c411b58fe ("x86/hyperv: implement an MSI domain for root partition")
> 
> from the hyperv tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks Stephen.

I've fixed up the conflicts locally in hyperv-next.

Wei.
