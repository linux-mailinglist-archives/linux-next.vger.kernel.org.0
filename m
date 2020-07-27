Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D117722E7B9
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 10:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgG0I3n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 04:29:43 -0400
Received: from mail-ej1-f52.google.com ([209.85.218.52]:33787 "EHLO
        mail-ej1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0I3n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 04:29:43 -0400
Received: by mail-ej1-f52.google.com with SMTP id g11so4394917ejr.0;
        Mon, 27 Jul 2020 01:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=nCH15011ULLgua14hO6k9+Wy0yqjOncFU6eW8oYQbYg=;
        b=Oc2Akq1nHstNB/PlJzNEyNkiY2SNDS/taKe5NiddO9QJFFFwc9Iw1roV81U8VSf9qi
         AcOOYkbQLx8Vk124cLbA2nERuLH6fxMBXMsZxrdvQB3KktWfHAvAGyXZ8xijB0RAsX3Q
         baaBPffw9OGarvmRc3qnWsPZ1+4xtJBoUEkUZJ31t2kRctbV8fREDsXOH7NdGCZmPVdH
         BD/Q/FKhZL9mLwKElmuX1TWkeMH95+tECyuc/fw4oDgi4nC2XXGitOGq/RDxfZNwCxdc
         orxPmFjl4SsKnRL9H03tDzB2+5Qq0EoXZ5fh6Cfs4c7TFrTaPsIr8HRVqiFjqciULmXc
         kZBQ==
X-Gm-Message-State: AOAM5316aKaNrdpurGBEuVf+x77JqX/pBJgQE7jh2Y3P6oLza7ESYYWe
        qrqzP5gYbGcELpbJ5hmumVxWLOKFTvI=
X-Google-Smtp-Source: ABdhPJz2CUV9C4KJyv+GvWrIA9OTOeJRCHY20K4L2aBZWq8Y1JyOs5XvBWrbylBvvLcVpxPH7xa6aw==
X-Received: by 2002:a17:906:4f82:: with SMTP id o2mr20642996eju.424.1595838581802;
        Mon, 27 Jul 2020 01:29:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id k25sm638841edj.84.2020.07.27.01.29.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 01:29:40 -0700 (PDT)
Date:   Mon, 27 Jul 2020 10:29:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Subject: Include krzk/linux-mem-ctrl (for drivers/memory) in next
Message-ID: <20200727082938.GA25420@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Please include in linux-next a new tree for drivers/memory:
URL: https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git

branches:
1. for-next
   into next,
2. fixes
   into pending fixes (for current cycle),

The tree will have patches later send via pull-request to arm-soc (Arnd,
Olof).

Best regards,
Krzysztof
