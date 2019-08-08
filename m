Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C5A86A8A
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 21:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404178AbfHHTZh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 15:25:37 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:37656 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404125AbfHHTZh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 15:25:37 -0400
Received: by mail-pl1-f176.google.com with SMTP id b3so43984693plr.4
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZG7Aiu7OQw3f16u3W7GLfaAF8S8vqKrbpAk/id0cgaA=;
        b=Jq5sVfKQ0hPrMipd9tzdgBE/vL9JwA87pRhTvAGhJ+gFsTDoc4nTfq8TTeXd+cQJOr
         /+HEtGw1xWZibB1tYeeur1Z9xJDMLYgh84oXhYniny9x/9g31Zy5HneeQONS5cKtT45b
         5d1x3crOYqm2FjoWj15VFI7D6HtdpA1WqtoR2k+YWu5xHbmkmR+9oFVOuP4LWArHfl/8
         KOrdouH2ST1edCO3dHMmTzDmBy1Af1n9HO2Iz3NaQOeB3AbHdDOdSSi3O7YToixYL03j
         sqSk4CyBuf6TUuwiXsv9PRYHKcdAdzo/+5ILhykGFg7q+hJj8uBiugX1cbWMrcJDCUqp
         IHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=ZG7Aiu7OQw3f16u3W7GLfaAF8S8vqKrbpAk/id0cgaA=;
        b=RP/zkm3ftVC3MdT9cmKY5RGXCLjDwSHrd0rin9chvKt6H6F/RtmClz8Xfq5NBZI9ET
         DBLfkytNfaW/r+QNycy2+rmYlNxgMGThQcKIzBEQvERkDRlUwnP5L3Ct4wHHydDOurXK
         ZWkaULziPs+hT26S8+4gyR7/EoZEEPiZ1nXHT9S/oPwPSUlxlYJrO1vpRJpUVnJwppKA
         T2Waw1t8VcFDACVWSsjWQMK9GPALnhMSx8JcUKRSL7iXnT6YipV5CTspd42+iG84t3Ug
         hlDXUtDjEjiaQ2ON32SoLRdnnCn1wc85CyLwKoyQouXIZkiV88rZR2ckBObMfNwQhXKJ
         eX+A==
X-Gm-Message-State: APjAAAWVYDM+JWKyt76c8vqXnUyN1cem1X0al2KAMHHIVCn7agwX1oyW
        1oJwpmmrKrmuut4ZCLWlxfs=
X-Google-Smtp-Source: APXvYqzXtoL4CK4Jrf1h0ByToUo3gH/95WHymx6k/tyUsz16HcxxEhrxIW22Vilqk7ceZ9+THb0mzA==
X-Received: by 2002:a17:902:9041:: with SMTP id w1mr15581882plz.132.1565292336806;
        Thu, 08 Aug 2019 12:25:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u7sm86278852pgr.94.2019.08.08.12.25.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 12:25:36 -0700 (PDT)
Date:   Thu, 8 Aug 2019 12:25:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tao Zhou <tao.zhou1@amd.com>
Cc:     amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
        hawking.zhang@amd.com, dennis.li@amd.com, broonie@kernel.org,
        akpm@linux-foundation.org, christian.koenig@amd.com,
        linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-build-reports@lists.linaro.org
Subject: Re: drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190808192535.GA18697@roeck-us.net>
References: <20190807025640.682-1-tao.zhou1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 07, 2019 at 10:56:40AM +0800, Tao Zhou wrote:
> readq/writeq are not supported on all architectures
> 
> Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Regarding the claim that this would work for 32-bit x86 builds:

make ARCH=i386 allmodconfig
make ARCH=i386 drivers/gpu/drm/amd/amdgpu/amdgpu_device.o

results in:

  ...
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function ‘amdgpu_mm_rreg64’:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function ‘readq’;

drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function ‘amdgpu_mm_wreg64’:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function ‘writeq’

This is with next-20190808.

Guenter
