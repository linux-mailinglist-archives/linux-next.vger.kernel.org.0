Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D16255952
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 13:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbgH1L0G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 07:26:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38671 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729150AbgH1LZt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 07:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598613941;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o2xsruahM84gvKT7Qi3NLYp+MUcUI5lRMv5l8xQEmWI=;
        b=HiP6Nltk6n1mU9bYBWNMuq/EpOfPmtPfmMsVUvE0cZS1gHU6eEAfd/S89uDtLoW0yLMgy6
        a1egn++v+3nlzGSbf+w+UPitlGZ2157zWpgbs81qnVF2IoYN39pRNIbSSmO3nOHnIHIL3b
        tznOzSzpLskW0M3cRD8ZhJzJh+h11lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-_ZxHe9C_MAmWQsycZaP5kw-1; Fri, 28 Aug 2020 07:25:39 -0400
X-MC-Unique: _ZxHe9C_MAmWQsycZaP5kw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48DB481F02E;
        Fri, 28 Aug 2020 11:25:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com [10.36.112.54])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B28893AF1;
        Fri, 28 Aug 2020 11:25:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id BA39F9C87; Fri, 28 Aug 2020 13:25:35 +0200 (CEST)
Date:   Fri, 28 Aug 2020 13:25:35 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm: virtio: fix kconfig dependency warning
Message-ID: <20200828112535.yn75nbjtjepsq7w6@sirius.home.kraxel.org>
References: <d3643dcf-87f4-ff45-fb90-9945458438f9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3643dcf-87f4-ff45-fb90-9945458438f9@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

  Hi,

>  config DRM_VIRTIO_GPU
>  	tristate "Virtio GPU driver"
> -	depends on DRM && VIRTIO && MMU
> +	depends on DRM && VIRTIO_MENU && MMU

Shouldn't this depend on both VIRTIO and VIRTIO_MENU, simliar to the
other virtio drivers?

take care,
  Gerd

