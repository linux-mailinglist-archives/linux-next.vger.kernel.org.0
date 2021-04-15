Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0658C360A2A
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 15:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbhDONJi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 09:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbhDONJW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2021 09:09:22 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C63C061756
        for <linux-next@vger.kernel.org>; Thu, 15 Apr 2021 06:08:58 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id i11so6089583qvu.10
        for <linux-next@vger.kernel.org>; Thu, 15 Apr 2021 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Av9lBh4ytQJLZDgCvCumBBm678aTIHFLWXFB6bVJiGk=;
        b=MjHrmHj3CxKqGBd/wHR9VR1eOkob2QYJ9Aeq0rkN3vePFB+JTxwCpU8ycDTeFNwpUZ
         t7JcUD3aKSEM1MTXPKb7eliUDURUr0m7JkhZTnCQ+QggTWSHzPT15NLUiMoFRvLsvTcp
         MujH3kN7+0dHS3pvIhfruu731O3qCDMiNH5zLY0q+lHp1ki7z7UJTI8WYoNXe5gESNrA
         miDO6KrL0zb2AMzSf7cG2g17pL+kj6Eri7EWR9XKqg7rc8sYsyIyaJqwnbH4fHuYzuN8
         yDLUup0nMkjt6ALnPeExIWExt0Y+B/bNa/A44hKD/B09wIPf27z3NhhTXp+IX7XC5SYl
         WH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Av9lBh4ytQJLZDgCvCumBBm678aTIHFLWXFB6bVJiGk=;
        b=i2ckmHp3aATXlv5eM9hDAslw33ddmZyZsFqfH/Jc6BCp2xJWRUWiygMJFdf7dEg3XQ
         XbECyc6qakXOL54VD2F7zcvP7GOqL8noudJ2TnlvNEn7ZcLJUkT1HlUAXqTPcb8edjJ/
         140+hOhLk2LR38+rzoYWWnj4E7RZfW0ItSqku05/bGwSefhqvF6d5ESxyxb5wXQJdc+y
         CNQrBEVU70ByPgVhzd8CEXVWaxg+oA9+vMUUVrgRqe/LNL7SM/lVABLn2KfHV8n+4/kb
         boIb+zFVxO1nD2OoNuwwBXwo5YnCXeJz1KuG/h2MbT1ZbReG4hSQDE7NH+IBYnNADxHV
         CmYA==
X-Gm-Message-State: AOAM5336d/BopFV/cCqvYDdNPQph1USGd5tt2XSvXzKSMl520uohb5T+
        1BP6yXm88IoKFoEuetWo3zyaWg==
X-Google-Smtp-Source: ABdhPJwBZbvTOtQ7JrjyHedhunLhY1PtV+CdCC/35yHj+3yXUnmSXDK4vTITiMNWCEVv9JExSNyNAg==
X-Received: by 2002:a05:6214:4b0:: with SMTP id w16mr2924175qvz.54.1618492137741;
        Thu, 15 Apr 2021 06:08:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id l24sm1755539qtp.18.2021.04.15.06.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 06:08:56 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lX1jr-006k2Q-Q4; Thu, 15 Apr 2021 10:08:55 -0300
Date:   Thu, 15 Apr 2021 10:08:55 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20210415130855.GR227011@ziepe.ca>
References: <20210415164734.1143f20d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415164734.1143f20d@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 15, 2021 at 04:47:34PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfio tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gvt/gvt.c
> 
> between commit:
> 
>   9ff06c385300 ("drm/i915/gvt: Remove references to struct drm_device.pdev")
> 
> from the drm tree and commit:
> 
>   383987fd15ba ("vfio/gvt: Use mdev_get_type_group_id()")
> 
> from the vfio tree.
> 
> I fixed it up (I used the latter version) and can carry the fix as
> necessary.

Yes that is right, thank you

Jason
