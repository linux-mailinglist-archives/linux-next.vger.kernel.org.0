Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3E2435DB7
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 11:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbhJUJQt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 05:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53660 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231334AbhJUJQs (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Oct 2021 05:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634807673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J4QEo41VTsTwWAkmS64CPF5ag+oMVY0ySDObr9iq3wE=;
        b=Nkk8Ug/IO0bXJNoiLUMdOXmqSYKghu0XUf87YlW+0M0CFEju4r743lV2Fy2n8Ln+kDRroI
        +4L4x7mDV1qh7YzppT1B4Au4kmDiXRzJuU/PJfE0Rep/b4n+0/bygaVIcFvHi91oAKWwLV
        5iHCRMaboYCcjXpZRFOHS0pE71IhNWA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Vg0qkkSZMpS_oQevp7MlIQ-1; Thu, 21 Oct 2021 05:14:31 -0400
X-MC-Unique: Vg0qkkSZMpS_oQevp7MlIQ-1
Received: by mail-ed1-f69.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so23684776edv.10
        for <linux-next@vger.kernel.org>; Thu, 21 Oct 2021 02:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J4QEo41VTsTwWAkmS64CPF5ag+oMVY0ySDObr9iq3wE=;
        b=iv9bCjTKTHq7P1W2UEtc2uEnLuBIGSxLtJIGsGd5N22/KDHuldevAfPLVs3ufebj91
         9b1zM343wykiDZrlnm2BXEWdNUHh/PFEuuRX++okjUdYxMtsrQO75+rmUCGYUZ3j0/IG
         foD85HBZhVFiyhoTSd4ehJVXPWueHrp1wWCtPqa8jVz/Ny+8SVdYWSsMp0LNMC7Z6gfL
         eAkguS/rUkCCS4uvnlozDyNaOO4Iazvo+q+Mx3JactcrbnBxBGQpGsEtZu5S5+OuqDtA
         1cXwRQFwY9HHVrY+oaLQctvYXrZZoChHEO21rlfnmN1Kb1eVhUX3Mqb8ivmhGgwpYXPn
         qijA==
X-Gm-Message-State: AOAM531VSE7dxrRsTt66ECbkk4qAdWvcSqHAH6l5A6wn3ypp1J6nlcMB
        AlbaDIwEVuvrMwKLzkovZ9c5Z8v5ieEzk1DsdP/uCKTpEIMR6A6YtuqnIAFgdbSce0pwR1AA0jA
        acNLnxLuWwm1eGezE+wQ2Gw==
X-Received: by 2002:a17:907:6d8b:: with SMTP id sb11mr5936891ejc.332.1634807670479;
        Thu, 21 Oct 2021 02:14:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC4w22ooQ1ELlXofPtV+YK9C8glzgtuKouEL6jVS4Up79AqNqfz7AVbJ0qtlCwjP+TfdczAw==
X-Received: by 2002:a17:907:6d8b:: with SMTP id sb11mr5936875ejc.332.1634807670313;
        Thu, 21 Oct 2021 02:14:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g18sm439733edb.36.2021.10.21.02.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 02:14:29 -0700 (PDT)
Message-ID: <2b5929e2-eb77-d625-5637-fd8353909fda@redhat.com>
Date:   Thu, 21 Oct 2021 11:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: linux-next: build warnings after merge of the drivers-x86 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211021184735.794b22a7@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211021184735.794b22a7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 10/21/21 09:47, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Unexpected indentation.
> Documentation/ABI/stable/sysfs-driver-mlxreg-io:230: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   527cd54d49dd ("Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces")

Thank you for reporting this.

I've a bit of a noob question which tool / make target generates these warnings?

I would like to make sure they are fixed, but first I must be able to reproduce
them.

Regards,

Hans

